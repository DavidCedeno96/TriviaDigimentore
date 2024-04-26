import { AfterViewInit, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Sala } from 'src/app/model/SalaModel';
import { Usuario } from 'src/app/model/UsuarioModel';
import { SalaService } from 'src/app/services/sala.service';
import { TimeApiService } from 'src/app/services/time-api.service';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-ingresar-juego',
  templateUrl: './ingresar-juego.component.html',
  styleUrls: ['./ingresar-juego.component.css'],
})
export class IngresarJuegoComponent implements OnInit, AfterViewInit {
  idSala: number = 0;
  expiroLink = false;

  verErrorsInputs: boolean = false;
  existeError: boolean = false;
  result: string = '';

  formulario!: FormGroup;
  sala: Sala = {
    idSala: 1,
    nombre: '',
    imagen: '',
    descripcion: '',
    idModoJuego: 0,
    modoJuego: '',
    estado: 1,
    totalPreguntas: 0,
    cantJugadas: 0,
    tiempoXpregunta: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    fechaActivacion: '',
    fechaCierre: '',
    fechaCierreLondon: '',
  };

  usuario: Usuario = {
    idUsuario: 0,
    nombre: '',
    correo: '',
    contrasena: '',
    idRol: 0,
    rol: '',
    iniciales: '',
    telefono: '',
  };

  logoEmpresa = 'assets/Imagenes Empresa/logo blanco.png';

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private encryptionService: EncryptionService,
    private salaServicio: SalaService,
    private timeServicio: TimeApiService,
    private usuarioServicio: UsuarioService,
    private constantsService: ConstantsService,
    private formBuilder: FormBuilder
  ) {
    this.formulario = this.formBuilder.group({
      nombre: [
        '',
        [
          Validators.required,
          Validators.maxLength(60),
          Validators.minLength(3),
          Validators.pattern(/^[^<>]+$/), // No se permiten caracteres invalidos
        ],
      ],
    });
  }

  ngOnInit(): void {
    this.constantsService.loading(true);
    this.getRouteParams();
  }

  ngAfterViewInit(): void {
    this.cargarData(this.idSala);
  }

  getRouteParams() {
    this.route.queryParams.subscribe((params) => {
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '') {
        history.back();
      }
      this.idSala = parseInt(idSala);
    });
  }

  cargarData(idSala: number) {
    this.salaServicio.itemSala(0, idSala, 0).subscribe({
      next: (data: any) => {
        console.log(data);

        const { info, error, sala } = data.result;
        this.result = info;
        if (error > 0) {
          //hay error
          this.existeError = true;
          this.expiroLink = true;
        } else {
          //no hay error
          this.existeError = false;
          this.sala = sala;

          let fechaCierreLondres = new Date(sala.fechaCierreLondon);

          this.timeServicio.getLondonTime().subscribe({
            next: (data: any) => {
              let fecha = data.datetime;
              const timeLondon = fecha.split('.')[0];
              const fechaActualLondres = new Date(timeLondon);

              if (fechaCierreLondres < fechaActualLondres) {
                this.expiroLink = true;
              } else {
                this.expiroLink = false;
              }
              this.constantsService.loading(false);
            },
          });
        }
      },
      error: (e) => {
        console.error(e);
        this.existeError = true;
        this.result = '¡Ha ocurrido un error! Inténtalo más tarde.';
      },
    });
  }

  onSubmit() {
    this.constantsService.loading(true);
    /*  console.log(this.formulario.valid);
    console.log(this.formulario.value); */

    if (this.formulario.valid) {
      this.verErrorsInputs = false;
      this.usuario = this.formulario.value;
      //console.log('Enviando el usuario....', this.usuario);

      this.usuarioServicio.crearUsuarioJugador(this.usuario).subscribe({
        next: (data: any) => {
          //console.log(data);
          let { info, error } = data.result;
          this.result = info;
          if (error === 0) {
            this.existeError = false;
            localStorage.setItem('token', info);
            let idSala = this.encryptionService.encrypt(this.idSala.toString());
            this.cambiarRuta('EntradaSala', { idSala });
          } else {
            this.existeError = true;
          }
          this.constantsService.loading(false);
        },
        error: (e) => {
          console.error(e);
          this.existeError = true;
          this.result = 'Ha! ocurrido un error intentalo mas tarde';
        },
      });
    } else {
      this.verErrorsInputs = true;
    }
  }

  cambiarRuta(ruta: string, params: object) {
    this.router.navigate([ruta], { queryParams: params });
  }
}
