import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ConstantsService } from 'src/app/constants.service';
import { EncryptionService } from 'src/app/encryption.service';
import { Sala } from 'src/app/model/SalaModel';
import { game1Model } from 'src/app/model/game1Model';
import { ComplementoService } from 'src/app/services/complemento.service';
import { ImagenesService } from 'src/app/services/imagenes.service';
import { SalaService } from 'src/app/services/sala.service';

@Component({
  selector: 'app-crear-sala',
  templateUrl: './crear-sala.component.html',
  styleUrls: ['./crear-sala.component.css'],
})
export class CrearSalaComponent implements OnInit {
  logoEmpresa = '';

  selectedCard: number = 0; // Inicialmente, ninguna tarjeta está seleccionada
  notSelectCard: boolean = false;
  selectedFile: File | null = null;
  type: string = '';
  //imageSala: string = '';
  titulo: string = '';

  existeError: boolean = false;
  result: string = '';

  nombreInput: FormControl;
  descripcionInput: FormControl;

  nuevaSala: Sala = {
    idSala: 1,
    nombre: '',
    imagen: '',
    descripcion: '',
    idModoJuego: 0,
    modoJuego: '',
    estado: 1,
    totalPreguntas: 0,
    cantJugadas: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    fechaActivacion: '',
  };

  selectedColor1: string = '#3671D1';
  selectedColor2: string = '#00002A';

  checkedDecoracion: boolean = true;
  checkedDecoracion2: boolean = true;
  checkedDecoracion3: boolean = true;
  checkedDecoracion4: boolean = true;

  complemento: game1Model;
  /* IMAGENES COMPLEMENTOS:  */
  viendoIzq: File;
  viendoDer: File;
  plat1: File;
  plat2: File;
  plat3: File;
  plat4: File;
  dec1: File;
  dec2: File;
  dec3: File;
  dec4: File;
  objCie1: File;
  objCie2: File;
  objFon1: File;
  objFon2: File;
  objFon3: File;
  objFon4: File;
  objFonMov: File;
  objFinal: File;
  sonido: File;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private salaServicio: SalaService,
    private complementoServicio: ComplementoService,
    private encryptionService: EncryptionService,
    private constantsService: ConstantsService,
    private imagenesService: ImagenesService
  ) {
    this.nombreInput = new FormControl('', [
      Validators.required,
      Validators.maxLength(20),
    ]);
    this.descripcionInput = new FormControl('', [
      Validators.required,
      Validators.maxLength(200),
    ]);
  }

  ngOnInit(): void {
    this.logoEmpresa = this.imagenesService._logoColores;

    this.route.queryParams.subscribe((params) => {
      this.type = params['type'];
      let idSala = this.encryptionService.decrypt(params['idSala']);
      if (idSala === '' && this.type === 'editar') {
        history.back();
      }
      if (this.type === 'editar') {
        this.nuevaSala.idSala = parseInt(idSala);
      }
    });
    switch (this.type) {
      case 'crear': {
        this.titulo = 'Crear Sala';
        break;
      }
      case 'editar': {
        this.constantsService.loading(true);
        this.titulo = 'Editar Sala';
        this.cargarData(this.nuevaSala.idSala);
        break;
      }
      default: {
        this.titulo = '';
        this.router.navigate(['/Administrador']);
        break;
      }
    }
  }

  selectCard(id: number) {
    this.selectedCard = id; // Cambia la tarjeta seleccionada al hacer clic
    this.notSelectCard = false;
  }

  onFileSelected(event: any) {
    this.selectedFile = event.target.files[0];
    console.log(this.selectedFile?.name);
  }

  UpsertSala() {
    if (this.selectedCard === 0) {
      this.notSelectCard = true;
      return;
    }
    this.constantsService.loading(true);
    switch (this.type) {
      case 'crear': {
        if (this.validForm()) {
          this.crearNuevaSala();
        }
        break;
      }
      case 'editar': {
        if (this.validForm()) {
          this.editarSala();
        }
        break;
      }
      default: {
        this.router.navigate(['/Administrador']);
        break;
      }
    }
  }

  cargarData(idSala: number) {
    this.salaServicio.itemSala(0, idSala, 0).subscribe({
      next: (data: any) => {
        const { info, error, sala } = data.result;
        this.result = info;
        console.log(this.result);
        if (error > 0) {
          //hay error
          this.existeError = true;
          this.constantsService.loading(false);
        } else {
          //no hay error
          this.existeError = false;
          this.nuevaSala = sala;
          /* this.imageSala = `${this.salaServicio.getURLImages()}/${
            this.nuevaSala.imagen
          }`; */
          if (this.nuevaSala.descripcion === 'N/A') {
            this.nuevaSala.descripcion = '';
          }
          this.selectedCard = this.nuevaSala.idModoJuego;

          this.getComplemento(idSala);
        }
        //this.constantsService.loading(false);
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        } else if (e.status == 400) {
          history.back();
        }
      },
    });
  }

  crearNuevaSala() {
    const formData = new FormData();
    formData.append('nombre', this.nuevaSala.nombre.trim());
    formData.append('descripcion', this.nuevaSala.descripcion.trim());
    formData.append('idModoJuego', this.selectedCard.toString());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }

    this.salaServicio.crearSala(formData).subscribe({
      next: (data: any) => {
        const { info, error, campo } = data.result;
        this.result = info;
        //console.log(info, campo);
        if (error > 0) {
          this.result += '_' + campo;
          this.existeError = true;
          this.constantsService.loading(false);
        } else {
          let idSalaCreada = info.split(',')[1];
          let nomSalaCreada = info.split(',')[2];
          this.createComplemento(0, idSalaCreada, nomSalaCreada);
          /* this.existeError = false;
          this.router.navigate(['/Administrador']); */
        }
        //this.constantsService.loading(false);
      },
      error: (e) => {
        //console.log(e);
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  editarSala() {
    const formData = new FormData();
    formData.append('idSala', this.nuevaSala.idSala.toString());
    formData.append('nombre', this.nuevaSala.nombre.trim());
    formData.append('descripcion', this.nuevaSala.descripcion.trim());
    formData.append('idModoJuego', this.selectedCard.toString());
    if (this.selectedFile) {
      formData.append('archivo', this.selectedFile);
    }
    this.salaServicio.editarSala(formData).subscribe({
      next: (data: any) => {
        const { info, error, campo } = data.result;
        this.result = info;
        console.log(info, campo);
        if (error > 0) {
          this.existeError = true;
        } else {
          this.updateComplemento(
            this.complemento.idCom,
            this.nuevaSala.idSala,
            this.nuevaSala.nombre.trim()
          );
          /* this.existeError = false;
          this.router.navigate(['/Administrador']); */
        }
        //this.constantsService.loading(false);
      },
      error: (e) => {
        //console.log(e);
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  validForm(): boolean {
    let isValid: boolean = true;
    if (this.nombreInput.hasError('maxlength')) {
      isValid = false;
    }

    if (this.descripcionInput.hasError('maxlength')) {
      isValid = false;
    }

    if (!isValid) {
      this.constantsService.loading(false);
    }
    return isValid;
  }

  onColorChange(): void {
    console.log(
      'Color seleccionado en formato hexadecimal:',
      this.selectedColor1
    );
  }

  onSwitchChange(event: any) {
    this.checkedDecoracion = event.target.checked;
  }
  onSwitchChange2(event: any) {
    this.checkedDecoracion2 = event.target.checked;
  }
  onSwitchChange3(event: any) {
    this.checkedDecoracion3 = event.target.checked;
  }
  onSwitchChange4(event: any) {
    this.checkedDecoracion4 = event.target.checked;
  }

  /* Compelementos */
  getComplemento(idSala: number) {
    this.complementoServicio.getItem(idSala).subscribe({
      next: (data: any) => {
        const { info, error, complemento } = data.result;
        this.complemento = complemento;
        //console.log(this.complemento);
        this.constantsService.loading(false);
      },
      error: (e) => {
        //console.log(e);
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  comFileSelected(event: any, name: string) {
    let file = event.target.files[0];
    switch (name) {
      case 'viendoIzq': {
        this.viendoIzq = file;
        break;
      }
      case 'viendoDer': {
        this.viendoDer = file;
        break;
      }
      case 'plat1': {
        this.plat1 = file;
        break;
      }
      case 'plat2': {
        this.plat2 = file;
        break;
      }
      case 'plat3': {
        this.plat3 = file;
        break;
      }
      case 'plat4': {
        this.plat4 = file;
        break;
      }
      case 'dec1': {
        this.dec1 = file;
        break;
      }
      case 'dec2': {
        this.dec2 = file;
        break;
      }
      case 'dec3': {
        this.dec3 = file;
        break;
      }
      case 'dec4': {
        this.dec3 = file;
        break;
      }
      case 'objCie1': {
        this.objCie1 = file;
        break;
      }
      case 'objCie2': {
        this.objCie2 = file;
        break;
      }
      case 'objFon1': {
        this.objFon1 = file;
        break;
      }
      case 'objFon2': {
        this.objFon2 = file;
        break;
      }
      case 'objFon3': {
        this.objFon3 = file;
        break;
      }
      case 'objFon4': {
        this.objFon4 = file;
        break;
      }
      case 'objFonMov': {
        this.objFonMov = file;
        break;
      }
      case 'objFinal': {
        this.objFinal = file;
        break;
      }
      case 'sonido': {
        this.sonido = file;
        break;
      }
    }
  }

  infoComplemento(idCom: number, idSala: number, nombreSala: string): FormData {
    let formData = new FormData();
    formData.append('IdCom', idCom.toString());
    formData.append('idSala', idSala.toString());
    formData.append('nombreSala', nombreSala);
    formData.append('color1', this.selectedColor1);
    formData.append('color2', this.selectedColor2);
    if (this.viendoIzq) {
      formData.append('viendoIzquierda', this.viendoIzq);
    }
    if (this.viendoDer) {
      formData.append('viendoDerecha', this.viendoDer);
    }
    if (this.plat1) {
      formData.append('plataforma1', this.plat1);
    }
    if (this.plat2) {
      formData.append('plataforma2', this.plat2);
    }
    if (this.plat3) {
      formData.append('plataforma3', this.plat3);
    }
    if (this.plat4) {
      formData.append('plataforma4', this.plat4);
    }
    if (this.dec1) {
      formData.append('decoracion1', this.dec1);
    }
    if (this.dec2) {
      formData.append('decoracion2', this.dec2);
    }
    if (this.dec3) {
      formData.append('decoracion3', this.dec3);
    }
    if (this.dec4) {
      formData.append('decoracion4', this.dec4);
    }
    if (this.objCie1) {
      formData.append('objetoCielo1', this.objCie1);
    }
    if (this.objCie2) {
      formData.append('objetoCielo2', this.objCie2);
    }
    if (this.objFon1) {
      formData.append('objetoFondo1', this.objFon1);
    }
    if (this.objFon2) {
      formData.append('objetoFondo2', this.objFon2);
    }
    if (this.objFon3) {
      formData.append('objetoFondo3', this.objFon3);
    }
    if (this.objFon4) {
      formData.append('objetoFondo4', this.objFon4);
    }
    if (this.objFonMov) {
      formData.append('objetoFondoMovil', this.objFonMov);
    }
    if (this.objFinal) {
      formData.append('objetoFinal', this.objFinal);
    }
    if (this.sonido) {
      formData.append('sonido', this.sonido);
    }

    return formData;
  }

  createComplemento(idCom: number, idSala: number, nombreSala: string) {
    /* AQUI LLAMA AL END POINT DE COMPLEMENTO */
    this.complementoServicio
      .crearItem(this.infoComplemento(idCom, idSala, nombreSala))
      .subscribe({
        next: (data: any) => {
          const { info, error, campo } = data.result;
          this.result = info;
          console.log(info, campo);
          if (error > 0) {
            this.existeError = true;
          } else {
            this.existeError = false;
            this.router.navigate(['/Administrador']);
          }
          this.constantsService.loading(false);
        },
        error: (e) => {
          //console.log(e);
          if (e.status === 401) {
            this.router.navigate(['/']);
          }
        },
      });
  }

  updateComplemento(idCom: number, idSala: number, nombreSala: string) {
    this.complementoServicio
      .updateItem(this.infoComplemento(idCom, idSala, nombreSala))
      .subscribe({
        next: (data: any) => {
          const { info, error, campo } = data.result;
          this.result = info;
          console.log(info, campo);
          if (error > 0) {
            this.existeError = true;
          } else {
            this.existeError = false;
            this.router.navigate(['/Administrador']);
          }
          this.constantsService.loading(false);
        },
        error: (e) => {
          //console.log(e);
          if (e.status === 401) {
            this.router.navigate(['/']);
          }
        },
      });
  }
}
