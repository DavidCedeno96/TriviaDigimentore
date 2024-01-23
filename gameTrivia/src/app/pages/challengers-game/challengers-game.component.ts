import {
  Component,
  HostListener,
  Renderer2,
  ElementRef,
  OnInit,
  AfterViewInit,
  Output,
  EventEmitter,
  Input,
  ViewChild,
  ViewChildren,
  QueryList,
  OnDestroy,
} from '@angular/core';
import {
  Opcion,
  Pregunta,
  Pregunta_OpcionList,
  SalaJuego,
} from 'src/app/model/SalaModel';
import { Options, LabelType } from 'ngx-slider-v2';
import { EncryptionService } from 'src/app/encryption.service';
import { Router } from '@angular/router';
import { UsuarioSalaService } from 'src/app/services/usuario-sala.service';
import { PuntosJugador } from 'src/app/model/PuntosJugador';
import { ConstantsService } from 'src/app/constants.service';
import { MessageService } from 'primeng/api';
import { SalaJuegoService } from 'src/app/services/sala-juego.service';

import * as PIXI from 'pixi.js';
import { ComplementoService } from 'src/app/services/complemento.service';
import { game1Model } from 'src/app/model/game1Model';
import { environment } from 'src/environments/environments';

declare var bootstrap: any;

@Component({
  selector: 'app-challengers-game',
  templateUrl: './challengers-game.component.html',
  styleUrls: ['./challengers-game.component.scss'],
  providers: [MessageService],
})
export class ChallengersGameComponent
  implements OnInit, AfterViewInit, OnDestroy
{
  //SIDEBAR
  sidebarVisible4: boolean = true;

  //controlar un error
  marginLeftValues: number[] = [];

  altura: number = 116;
  contadorCiclo: number = 0;
  maximoContador: number = 19;

  isEdificioPar: boolean = true;

  lineas: any[] = [];
  container = document.getElementById('containerFondo');
  @ViewChildren('elementoImagen') elementosImagen?: QueryList<ElementRef>;

  @Output() numVentanaH = new EventEmitter<number>();
  @Input() PreguntasList: Pregunta_OpcionList[] = [];
  @Input() idJugador: number = 0;

  EdificiosCount: number[] = [];

  //Ruta de las imagenes que van entre los botones

  imagenFinal: string = 'assets/Imagenes Juego/CasaFinal.png';

  numImagenesColocadas: number = 0;

  //Menjase error
  Mensaje_error: string = 'Respuesta equivocada';

  //Para creara los botones y las imagenes

  botones: {
    id: any;
    svg: string;
    tipo: string;
    rutaImagen: string;
  }[] = [];

  //Para las posiciones senosoidales

  centroX: number = 20;
  centroY: number = 20;
  cantidadDeBotones = 20;
  amplitud = 50;
  frecuencia = 10; // Ajusta la frecuencia según la cantidad de botones

  //Para el modal

  mostrarAlert = false;
  mostrarWrongAlert = false;
  modalElement: any;
  modal: any;

  //Para colocar las preguntas
  preguntaActual: Pregunta = {
    idPregunta: 0,
    nombre: 'Mi primera Pregunta de prueba',
    idSala: 0,
    estado: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
  };

  opcioTest1: Opcion = {
    idOpcion: 1,
    nombre: 'Primera opción para responder a la pregunta',
    correcta: 0,
    estado: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    idPregunta: 0,
  };

  opcioTest2: Opcion = {
    idOpcion: 2,
    nombre: 'Segunda opción para responder a la pregunta',
    correcta: 1, //0 para falso; 1 verdadero
    estado: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
    idPregunta: 0,
  };

  preguntaOpcionActual: Pregunta_OpcionList = {
    pregunta: this.preguntaActual,
    opcionList: [this.opcioTest1, this.opcioTest2, this.opcioTest1],
  };
  preguntaOpcionTest: Pregunta_OpcionList = {
    pregunta: this.preguntaActual,
    opcionList: [this.opcioTest1, this.opcioTest2],
  };

  listaDePreguntas: Pregunta_OpcionList[] = [];

  listaPosiciones: SalaJuego[] = [];

  // numPreguntaActual: number = 0;
  preguntaTexto: string = '';
  actualOpcionList: any[] = [];
  botonSeleccionado: boolean[] = [];

  numPreguntasContestadas: number = 0;
  puntosGanados: number = 0;
  puedeResponder: boolean = true;

  //MUSICA
  musicaFondo: HTMLAudioElement | null = null;

  //TEMPORIZADOR Y SUMA DEL TIEMPO QUE SE DEMORQA EN RESPONDER

  numIntervaloImg: number = 4;
  countdown: number = 20; // Temporizador principal en segundos

  mainTimerInterval: any;
  userClicked: boolean = false;
  startTime: Date = new Date('2023-10-10T10:00:00');
  userClickTime: Date = new Date('2023-10-10T10:00:00');

  tiempoDelJugador: number = 0;
  isTimerRunning: boolean = false;

  juegoTerminado: boolean = false;

  //PARA EL SLIDER DE NG PRIME

  value: number = 0; // Valor del slider

  optionsMia: Options = {
    floor: 0,
    ceil: this.cantidadDeBotones,
    showTicks: true,
    tickStep: 5,
    readOnly: true,
  };
  optionsAux: Options = {
    floor: 0,
    ceil: this.cantidadDeBotones,
    showTicks: false,
    readOnly: true,
  };

  optionsMeta: Options = {
    floor: 0,
    ceil: this.cantidadDeBotones,
    showTicks: false,
    readOnly: true,
  };
  valueMeta: number = 0;

  idSala: number = 0;

  puntosJugador: PuntosJugador = {
    idUsuario: 0,
    iniciales: 'PP',
    usuario: 'Preuba preuba',
    rol: '',
    idSala: 0,
    sala: '',
    puntaje: 23,
    tiempo: 0,
    fecha_creacion: '',
    fecha_modificacion: '',
  };

  //Tiempo
  tiempoMostrarPrimerModal: number = 5000;
  tiempoMostrarModal: number = 6000;

  @HostListener('mousewheel', ['$event'])
  onWheel(event: any) {
    event.preventDefault();
  }

  colores = [
    '#c9700394',
    '#d89e578f',
    '#b39039b5',
    '#c9700394',
    '#d89e578f',
    '#b39039b5',
    '#c9700394',
    '#d89e578f',
    '#b39039b5',
    '#c9700394',
    '#d89e578f',
    '#b39039b5',
  ];

  //PIXI JS
  @ViewChild('pixiContainer', { static: false }) pixiContainer: ElementRef;
  private character: PIXI.Sprite;
  private app: PIXI.Application;
  yfloor1 = 0;

  private isAnswerCorrect: boolean = true;

  //PISO

  private stars: PIXI.Sprite[] = [];
  private starsTextures: PIXI.Texture[] = [];

  private floors: PIXI.Sprite[] = [];
  private floorTextures: PIXI.Texture[] = [];

  private rocks: PIXI.Sprite[] = [];
  private rocksTextures: PIXI.Texture[] = [];

  //NAVE
  private spaceShip: PIXI.Sprite;

  //SALTO CHARACTER

  private gravity = 0.5; // Valor positivo para simular la gravedad
  private jumpVelocity = -14; // Velocidad inicial del salto hacia arriba
  private velocityY = 0; // Velocidad vertical actual del héroe
  private velocityX = 0;
  private direccion = false; //false derecha y true izquierda

  boolSaltar = false;
  private vx = 0.05;
  private firstTime = true;

  //HEIGTH DE LOS OBJETOS
  private hCharacter = 155;
  private hbackground = 345;
  private hbackgroundmovil = 774;

  private hSkyObject1 = 195;
  private hSkyObject1_movil = 136;
  private hSkyObject2 = 142;

  private hFinalObject = 170; //El objeto que sale al final del juego (en este caso la nave)

  //Rutas Sprites
  private characterSprite1 = 'assets/game1/Characters2.png';
  private characterSprite2 = 'assets/game1/Characters1.png';

  private rutaSpace = 'assets/game1/';
  private rutaFondoMovil = this.rutaSpace + 'Estrellas movil.png';
  private rutaObjetoFondo1 = this.rutaSpace + 'planeta1.png';
  private rutaObjetoFondo2 = this.rutaSpace + 'planeta2.png';
  private rutaPlataforma1 = this.rutaSpace + 'plataforma1.png';
  private rutaPlataforma2 = this.rutaSpace + 'plataforma2.png';
  private rutaPlataforma3 = this.rutaSpace + 'plataforma3.png';
  private rutaPlataforma4 = this.rutaSpace + 'plataforma4.png';
  private rutaadorno1 = this.rutaSpace + 'piedras1.png';
  private rutaadorno2 = this.rutaSpace + 'piedras2.png';
  private rutaadorno3 = this.rutaSpace + 'piedras2.png';
  private rutaadorno4 = this.rutaSpace + 'piedras2.png';

  private rutaFondoDesk1 = this.rutaSpace + 'StarsD1.png';
  private rutaFondoDesk2 = this.rutaSpace + 'StarsD2.png';
  private rutaFondoDesk3 = this.rutaSpace + 'StarsD3.png';
  private rutaFondoDesk4 = this.rutaSpace + 'StarsD4.png';

  private rutaFinalObject = this.rutaSpace + 'nave2.png';

  color1 = '#3671D1';
  color2 = '#00002A';

  isDecoration = true;
  isSkyObjects = true;
  isBackgroundObjects = true;
  isFinalObject = true;

  private boolFinishTextures: boolean[] = [false, false];

  constructor(
    private renderer: Renderer2,
    private el: ElementRef,
    private encryptionService: EncryptionService,
    private router: Router,
    private usuarioSalaService: UsuarioSalaService,
    private constantsService: ConstantsService,
    private salaJuegoService: SalaJuegoService,
    private complementoService: ComplementoService,
    private messageService: MessageService
  ) {
    this.numPreguntasContestadas = 0;
    this.puntosGanados = 0;
    this.puedeResponder = true;
    this.tiempoDelJugador = 0; //Tiempo que se demora en contestar las preguntas, esto se acumula
  }

  ngOnInit() {
    this.container = document.getElementById('containerFondo');
    //MUSICA NO LE PONEMOS EN METODO APARTE PORQUE DEJA DE FUNCIONAR
    this.musicaFondo = new Audio();
    this.musicaFondo.src = 'assets/musicAndSFX/SpaceFondo.mp3'; // Ruta a tu archivo de música
    this.musicaFondo.loop = true;
    this.musicaFondo.volume = 0.25; // Volumen (0.5 representa la mitad del volumen)
    this.musicaFondo.play();

    setTimeout(() => {
      this.mostrarModal(); //ACTIVAR CUANDO TERMINES DE TESTEAR <------------
      //console.log("Entro");
    }, this.tiempoMostrarPrimerModal);

    this.idSala = this.PreguntasList[0].pregunta.idSala;
    this.listaDePreguntas = this.PreguntasList;

    this.rellenarPregunta(1);
    //this.updateCenters(window.innerWidth);
    //console.log(this.PreguntasList);

    this.getListaPosiciones(this.idSala, this.idJugador);
  }

  ngAfterViewInit() {
    //pixi program
    this.app = new PIXI.Application({ backgroundAlpha: 0, resizeTo: window });

    /* this.app = new PIXI.Application({ background: '#1099bb', resizeTo: window });
     */

    this.pixiContainer.nativeElement.appendChild(this.app.view);
    const container = new PIXI.Container();
    this.app.stage.addChild(container);
    //CARGAR IMAGENES DE LA API
    this.getComponentesList();
    
    //Slide para la meta
    this.optionsMeta = {
      readOnly: true,
      floor: 0,
      ceil: this.listaDePreguntas.length,
      showTicks: false,
      translate: (value: number, label: LabelType): string => {
        switch (label) {
          case LabelType.Low:
            return '';

          default:
            return '';
        }
      },
      getPointerColor: (value: number): string => {
        return '#ef7d00';
      },
    };
    this.valueMeta = this.listaDePreguntas.length;
    // Obtén el elemento .sinusoidal-container por su ID

    // Verifica si el elemento se encontró antes de intentar establecer la altura

    this.actualizarMiSlider();
  }

  ngOnDestroy(): void {
    this.modal.hide();
    this.sidebarVisible4 = false;
    this.lineas.forEach((linea) => linea.remove());
  }

  getComponentesList() {
    this.complementoService.getItem(this.idSala).subscribe({
      next: (data: any) => {
        console.log(data);
        const { info, error, complemento } = data.result;
        if (error === 0) {
          let com: game1Model = complemento;
          this.cargarElementos(
            this.getImageCom(com.viendoIzquierda, 'Characters2.png'),
            this.getImageCom(com.viendoDerecha, 'Characters1.png'),
            com.color1,
            com.color2,
            this.getImageCom(com.plataforma1, 'plataforma1.png'),
            this.getImageCom(com.plataforma2, 'plataforma2.png'),
            this.getImageCom(com.plataforma3, 'plataforma3.png'),
            this.getImageCom(com.plataforma4, 'plataforma4.png'),
            com.isDecoration,
            this.getImageCom(com.decoracion1, 'piedras1.png'),
            this.getImageCom(com.decoracion2, 'piedras2.png'),
            this.getImageCom(com.decoracion3, 'piedras2.png'),
            this.getImageCom(com.decoracion4, 'piedras2.png'),
            com.isSkyObjects,
            this.getImageCom(com.objetoCielo1, 'planeta1.png'),
            this.getImageCom(com.objetoCielo2, 'planeta2.png'),
            com.isBackgroundObjects,
            this.getImageCom(com.objetoFondo1, 'StarsD1.png'),
            this.getImageCom(com.objetoFondo2, 'StarsD2.png'),
            this.getImageCom(com.objetoFondo3, 'StarsD3.png'),
            this.getImageCom(com.objetoFondo4, 'StarsD4.png'),
            this.getImageCom(com.objetoFondoMovil, 'Estrellas movil.png'),
            com.isFinalObject,
            this.getImageCom(com.objetoFinal, 'nave2.png')
          );
        } else {
          window.location.reload();
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  getImageCom(image: string, imgDefault: string): string {
    let imageRuta = '';

    if (image !== '') {
      imageRuta = `${environment.URL}/Content/Images/Complemento/${image}`;
    } else {
      imageRuta = `assets/game1/${imgDefault}`;
    }
    //console.log(imageRuta);
    return imageRuta;
  }

  //Fondo
  private createFondo(): void {
    //Planeta1
    var texturePlaneta1 = PIXI.Texture.from(this.rutaObjetoFondo1);
    const planet1 = new PIXI.Sprite(texturePlaneta1);

    var texturePlaneta2 = PIXI.Texture.from(this.rutaObjetoFondo2);
    const planet2 = new PIXI.Sprite(texturePlaneta2);

    //Estrellas
    if (this.isBackgroundObjects) {
      if (this.app.screen.width < 577) {
        var textureStar = PIXI.Texture.from(this.rutaFondoMovil);
        const stars = new PIXI.Sprite(textureStar);
        stars.anchor.set(0.5);
  
        var resp = stars.texture.baseTexture.valid;
        const checkTextureS = () => {
          if (resp) {
            stars.x = this.app.screen.width / 2;
            stars.y = this.app.screen.height / 2 - 100;
  
            //Calculamos el ancho
            const proporcion = this.hbackgroundmovil / stars.height;
            const newWidth = stars.width * proporcion;
  
            stars.height = this.hbackgroundmovil;
            stars.width = newWidth;
            this.app.stage.addChild(stars);
          } else {
            resp = stars.texture.baseTexture.valid;
            requestAnimationFrame(checkTextureS);
          }
        };
        checkTextureS();
      } else {
        for (let i = 0; i < this.starsTextures.length; i++) {
          const texture = this.starsTextures[i];
          const stars = new PIXI.Sprite(texture);
  
          var resp = stars.texture.baseTexture.valid;
          const checkTexture = (iValue: number) => {
            //console.log("entrar texture")
            if (resp) {
              //Calculamos el ancho
              const proporcion = this.hbackground / stars.height;
              const newWidth = stars.width * proporcion;
  
              switch (iValue) {
                case 0:
                  stars.anchor.set(0);
                  stars.x = 50;
  
                  break;
                case 1:
                  stars.anchor.set(1, 0);
                  stars.x = this.app.screen.width - 50;
                  break;
                case 2:
                  stars.anchor.set(0, 1);
                  stars.x = 50;
                  stars.y = this.app.screen.height - 200;
                  break;
                case 3:
                  stars.anchor.set(1, 1);
                  stars.x = this.app.screen.width - 50;
                  stars.y = this.app.screen.height - 200;
                  break;
                default:
                  break;
              }
              //stars.scale.set(0.95);
              stars.width = newWidth;
              stars.height = this.hbackground;
              this.app.stage.addChild(stars);
            } else {
              resp = stars.texture.baseTexture.valid;
              //console.log(this.character.texture.baseTexture.valid);
              requestAnimationFrame(() => checkTexture(iValue));
            }
          };
          checkTexture(i);
        }
      }
      
    }
   

    //Planetas
    //Necesitamos que la textura se cargue para detectar el tamaño de la imagen
    if (this.isSkyObjects) {
      var resp2 = planet1.texture.baseTexture.valid;
    const checkTexture2 = () => {
      //console.log("entrar texture")
      if (resp2) {
        this.boolFinishTextures[0] = true;

        planet1.anchor.set(0, 0.5);
        if (this.app.screen.width < 577) {
          //Calculamos el ancho
          const proporcion = this.hSkyObject1_movil / planet1.height;
          const newWidth = planet1.width * proporcion;
          //planet1.scale.set(0.35);
          planet1.width = newWidth;
          planet1.height = this.hSkyObject1_movil;
          planet1.x = planet1.width / 4 + 10;
          planet1.y = this.app.screen.height / 2 - 100;
        } else {
          //Calculamos el ancho
          const proporcion = this.hSkyObject1 / planet1.height;
          const newWidth = planet1.width * proporcion;
          planet1.width = newWidth;
          planet1.height = this.hSkyObject1;

          planet1.x = planet1.width / 4 + 100;
          planet1.y = this.app.screen.height / 2 - 100;
          //planet1.scale.set(0.5);
        }

        this.app.stage.addChild(planet1);
        //Posición inicial
      } else {
        resp2 = planet1.texture.baseTexture.valid;
        //console.log(this.character.texture.baseTexture.valid);
        requestAnimationFrame(checkTexture2);
      }
    };
    checkTexture2();

    //Planeta2
    if (this.app.screen.width > 580) {
      var resp3 = planet2.texture.baseTexture.valid;
      const checkTexture3 = () => {
        //console.log("entrar texture")
        if (resp3) {
          this.boolFinishTextures[1] = true;
          planet2.anchor.set(1, 0.5);
          planet2.x = this.app.screen.width - 80;
          planet2.y = this.app.screen.height / 2 - 300;
          //Calculamos el ancho
          const proporcion2 = this.hSkyObject2 / planet2.height;
          const newWidth = planet2.width * proporcion2;
          planet2.width = newWidth;
          planet2.height = this.hSkyObject2;

          this.app.stage.addChild(planet2);
        } else {
          resp3 = planet2.texture.baseTexture.valid;
          //console.log(this.character.texture.baseTexture.valid);
          requestAnimationFrame(checkTexture3);
        }
      };
      checkTexture3();
    }
      
    }
    
  }
  //CHARACTER

  private createHero(): void {
    // Ajusta la ruta a tu imagen de héroe
    this.character = PIXI.Sprite.from(this.characterSprite1);

    //Necesitamos que la textura se cargue para detectar el tamaño de la imagen
    var resp = this.character.texture.baseTexture.valid;
    const checkTexture = () => {
      //console.log("entrar texture")
      if (resp) {
        //Calculamos el ancho
        const proporcion = this.hCharacter / this.character.height;
        const newWidth = this.character.width * proporcion;

        // Establecer tamaño
        this.character.height = this.hCharacter;
        this.character.width = newWidth;

        this.character.anchor.set(0.5);
        this.character.x = this.app.screen.width / 2;
        this.character.y = this.app.screen.width - this.character.height * 1.25; // Posición inicial
        this.app.stage.addChild(this.character);
      } else {
        resp = this.character.texture.baseTexture.valid;
        //console.log(this.character.texture.baseTexture.valid);
        requestAnimationFrame(checkTexture);
      }
    };
    checkTexture();
  }

  private loadFloorTextures(): void {
    //PISOS

    const texturePaths = [
      this.rutaPlataforma1,
      this.rutaPlataforma2,
      this.rutaPlataforma3,
      this.rutaPlataforma4,
    ];

    texturePaths.forEach((path) => {
      const texture = PIXI.Texture.from(path);
      this.floorTextures.push(texture);
    });

    //PIEDRAS
    const texturePaths2 = [
      this.rutaadorno1,
      this.rutaadorno2,
      this.rutaadorno3,
      this.rutaadorno4,
    ];

    //ESTRELLAS

    const texturePaths3 = [
      this.rutaFondoDesk1,
      this.rutaFondoDesk2,
      this.rutaFondoDesk3,
      this.rutaFondoDesk4,
    ];

    texturePaths2.forEach((path) => {
      const texture = PIXI.Texture.from(path);
      this.rocksTextures.push(texture);
    });

    texturePaths3.forEach((path) => {
      const texture = PIXI.Texture.from(path);
      this.starsTextures.push(texture);
    });
  }

  private createFloors(): void {
    const h = this.app.screen.height;
    const w = this.app.screen.width;
    //const floorYPositions = [h -240, h-400  ];
    const floorXPositions = [
      w / 2,
      w / 2 - 100,
      w / 2 + 100,
      w / 2 - 100,
      w / 2 + 100,
    ];
    //const floorW = [290,170,190,290];
    const floorH = [120, 100, 100, 120];
    const base = h - 240;
    var floorYPositions: number[] = [base];
    var distanciaH = 160;

    //Rellenar posiciones en y
    for (let i = 0; i < this.listaDePreguntas.length; i++) {
      floorYPositions.push(base - distanciaH * (i + 1));
    }
    console.log('this.listaDePreguntas.length ' + this.listaDePreguntas.length);

    const numTextures = this.floorTextures.length;
    var jT = 1;

    for (let i = 0; i < this.listaDePreguntas.length; i++) {
      //Rellenar pisos
      const texture = this.floorTextures[jT - 1];
      const floor = new PIXI.Sprite(texture);

      //Necesitamos que la textura se cargue para detectar el tamaño de la imagen
      var resp = floor.texture.baseTexture.valid;
      const checkTexture = (iValue: number, jValue: number) => {
        //console.log("entrar texture")
        if (resp) {
          //Calculamos el ancho
          const proporcion = floorH[jValue - 1] / floor.height;
          const newWidth = floor.width * proporcion;

          floor.anchor.set(0.5, 0);
          floor.height = floorH[jValue - 1];
          floor.width = newWidth;

          //floor.height = floorH[jValue-1];
          if (iValue <= 4) {
            floor.x = floorXPositions[iValue];
          } else {
            floor.x = floorXPositions[jValue - 1];
          }

          floor.y = floorYPositions[iValue];
          this.floors.push(floor);
          this.app.stage.addChild(floor);
        } else {
          resp = floor.texture.baseTexture.valid;
          //console.log(this.character.texture.baseTexture.valid);
          requestAnimationFrame(() => checkTexture(iValue, jValue));
        }
      };
      checkTexture(i, jT);

      //console.log(jT);

      ///Rellenar rocas
      if (this.isDecoration) {
        const textureR = this.rocksTextures[jT - 1];
      const rock = new PIXI.Sprite(textureR);

      var resp2 = rock.texture.baseTexture.valid;
      const checkTexture2 = (iValue: number, jValue: number) => {
        //console.log("entrar texture")
        if (resp2) {
          //Calculamos el ancho
          const proporcion = floorH[jValue - 1] / floor.height;
          const newWidth = floor.width * proporcion;

          rock.anchor.set(0.5, 0.95);
          rock.width = newWidth * 0.6;
          rock.height = floorH[jValue - 1] * 0.6;
          if (iValue <= 4) {
            rock.x = floorXPositions[iValue] + 30;
          } else {
            rock.x = floorXPositions[jValue - 1] + 30;
          }
          rock.y = floorYPositions[iValue];
          this.rocks.push(rock);
          this.app.stage.addChild(rock);
        } else {
          resp2 = rock.texture.baseTexture.valid;
          //console.log(this.character.texture.baseTexture.valid);
          requestAnimationFrame(() => checkTexture2(iValue, jValue));
        }
      };
      checkTexture2(i, jT);
        
      }
      

      jT++;
      if (jT > numTextures) {
        jT = 1;
      }
    }

    //Nave
    if (this.isFinalObject) {
      const textureSpaceShip = PIXI.Texture.from(this.rutaFinalObject);
    const ship = new PIXI.Sprite(textureSpaceShip);

    //Necesitamos que la textura se cargue para detectar el tamaño de la imagen
    var resp3 = ship.texture.baseTexture.valid;
    const checkTexture3 = () => {
      //console.log("entrar texture")
      if (resp3) {
        //Calculamos el ancho
        const proporcion = this.hFinalObject / ship.height;
        const newWidth = ship.width * proporcion;

        // Establecer tamaño
        ship.anchor.set(0.5);
        ship.width = newWidth;
        ship.height = this.hFinalObject;
        ship.x = floorXPositions[0] + 50;
        //floor.y = floorYPositions[this.listaDePreguntas.length];
        ship.y = floorYPositions[floorYPositions.length - 1] - 100;
        this.spaceShip = ship;
        this.app.stage.addChild(ship);
      } else {
        resp3 = ship.texture.baseTexture.valid;
        //console.log(this.character.texture.baseTexture.valid);
        requestAnimationFrame(checkTexture3);
      }
    };
    checkTexture3();
      
    }
    
  }

  private jump(): void {
    //console.log(" velocityY "+ this.velocityY );
    // Aplicar gravedad
    this.velocityY += this.gravity;
    this.velocityX += this.vx;

    // Actualizar la posición vertical del héroe
    this.character.y += this.velocityY;
    if (this.boolSaltar) {
      if (this.direccion) {
        this.character.x -= this.velocityX;
      } else {
        this.character.x += this.velocityX;
      }
    }

    // Asegurarse de que el héroe no se desplace fuera de la pantalla
    if (this.character.y > this.yfloor1 - this.character.height * 1.25) {
      // Ajusta este valor según la altura de tu escena

      this.character.y = this.yfloor1 - this.character.height * 1.25;
      //this.character.x = 600;
      this.velocityY = 0;
      this.velocityX = 0;
      if (!this.respondiendo && this.boolSaltar) {
        this.respondiendo = true;
        this.mostrarModal();
      }
      this.boolSaltar = false;

      //this.character = PIXI.Sprite.from('assets/game1/Characters1.png');
    }
  }

  private respondiendo: boolean = false;

  private downfloor() {
    let translateRocks: number = 2.91;
    if (this.boolSaltar) {
      this.floors.forEach(function (floor) {
        floor.y += translateRocks;
      });
      if (this.isDecoration) {
        this.rocks.forEach(function (rock) {
          rock.y += translateRocks;
        });
      }
      
      if (this.isFinalObject) {
        this.spaceShip.y += translateRocks;        
      }
      
    }
  }

  private update(): void {
    this.jump();
    this.downfloor();
    //wthis.collisionfloor();
  }

  private setupKeyboard(): void {
    document.addEventListener('keydown', this.onKeyDown.bind(this));
  }

  private onKeyDown(event: KeyboardEvent): void {
    /* if (event.code === 'KeyW') {
      this.jumpCharacter();
    } */
  }

  private jumpCharacter(): void {
    if (this.direccion) {
      this.character.texture = PIXI.Texture.from(this.characterSprite2);
      this.direccion = false;
    } else {
      this.character.texture = PIXI.Texture.from(this.characterSprite1);
      this.direccion = true;
    }
    this.boolSaltar = true;
    this.velocityY = this.jumpVelocity;
    if (!this.firstTime) {
      this.vx = 0.12;
    }
    this.firstTime = false;
  }

  getListaPosiciones(idSala: number, idJugador: number) {
    this.salaJuegoService.getList(idSala, idJugador).subscribe({
      next: (data: any) => {
        //console.log(data);

        let { error, info, lista } = data.result;
        if (error > 0) {
        } else {
          //console.log(lista);
          this.listaPosiciones = lista;
        }
      },
      error: (e) => {
        console.log(e);
      },
    });
  }

  rellenarPregunta(numPregunta: number) {
    //console.log(numPregunta);
    setTimeout(() => {
      this.quitarSeleccionado();
      const PreguntaActual = this.listaDePreguntas[numPregunta - 1];
      this.preguntaTexto = PreguntaActual.pregunta.nombre;
      this.actualOpcionList = PreguntaActual.opcionList;
      //Activamos el primer boton del camino
      if (numPregunta == 1) {
        //this.activarBoton(1, 1);
      }
    }, 1000);
  }

  quitarSeleccionado() {
    const reiniciarSeleccionados: boolean[] = [];
    for (let i = 0; i < this.actualOpcionList.length; i++) {
      reiniciarSeleccionados.push(false);
    }
    this.botonSeleccionado = reiniciarSeleccionados;
  }

  mostrarModal() {
    this.getListaPosiciones(this.idSala, this.idJugador);
    //this.sidebarVisible4 = false;
    this.value++;
    this.modalElement = this.el.nativeElement.querySelector('#exampleModal');
    this.modal = new bootstrap.Modal(this.modalElement);
    this.resetTimer();
    const mainBody = document.getElementById('main-body');
    if (mainBody) {
      mainBody.style.overflowY = 'hidden';
    }

    this.modal.show();
    //this.musicaFondo.play();
    //TIEMPO
    this.startTime = new Date(); //CAPTURAMOS LA HORA QUE EMPIEZA EN MILISENGOS
  }

  closeModal(id: number) {
    if (this.puedeResponder) {
      this.userClicked = true;
      this.stopTimer(); // Detiene el temporizador principal
      this.userClickTime = new Date();
      this.puedeResponder = false;

      this.botonSeleccionado[id] = true;
      const respuestaSeleccionada = this.actualOpcionList[id];
      this.tiempoDelJugador +=
        this.userClickTime.getTime() - this.startTime.getTime();
      //console.log(this.tiempoDelJugador);

      if (respuestaSeleccionada.correcta === 1) {
        this.isAnswerCorrect = true;
        //AQUI PONER LA ACTUALIZACION DE LAS POSICIONES
        let juego = {
          idSala: this.idSala,
          idJugador: this.idJugador,
          nombre: 'prueba',
          iniciales: 'pp',
          posicion: 1,
          estadoJuego: 1,
        };
        this.actualizarPosicion(juego);
        // La respuesta es correcta, puedes reproducir un sonido, cambiar el color, etc.
        this.puntosGanados++;
        this.mostrarAlert = true;
        this.reproducirSonido('assets/musicAndSFX/CorrectSpace.mp3');

        setTimeout(() => {
          this.mostrarAlert = false;
          //this.moverVehiculo();
          this.modal.hide();
          this.sidebarVisible4 = true;
          this.numPreguntasContestadas++;
          this.puedeResponder = true;
          this.countdown = 20;
        }, 3000); // 3000 milisegundos = 3 segundos
      } else {
        this.Mensaje_error = 'Respuesta equivocada';
        this.preguntaMalConstestada();
      }
      this.pasarAOtraPregunta();
    }
  }

  actualizarPosicion(juego: SalaJuego) {
    this.salaJuegoService.updateItem(juego).subscribe({
      next: (data: any) => {
        let { error } = data.result;
        if (error === 0) {
          console.log('posicion actualizada');
        }
      },
      error: (e) => {
        console.log(e);
      },
    });
  }

  preguntaMalConstestada() {
    this.isAnswerCorrect = false;
    const indexCorrecto = this.actualOpcionList.findIndex(
      (item) => item.correcta === 1
    ); //Obtengo la id del correcto
    this.botonSeleccionado[indexCorrecto] = true; //Activo al correcto

    this.mostrarWrongAlert = true;
    this.reproducirSonido('assets/musicAndSFX/WrongSpace.mp3');
    setTimeout(() => {
      this.mostrarWrongAlert = false;
      this.modal.hide();
      this.sidebarVisible4 = true;
      //this.moverVehiculo();
      this.numPreguntasContestadas++;
      this.puedeResponder = true;
      this.countdown = 20;
    }, 3000); // 3000 milisegundos = 3 segundos
  }

  pasarAOtraPregunta() {
    //console.log(this.numPreguntasContestadas);
    //console.log(this.listaDePreguntas.length);

    if (this.numPreguntasContestadas + 1 < this.listaDePreguntas.length) {
      setTimeout(() => {
        //this.activarBoton(this.numPreguntasContestadas + 1, 1);
        this.rellenarPregunta(this.numPreguntasContestadas + 1);
        //Mostraremos el modal cuando termine de saltar Es decir saltar aqui
        this.respondiendo = false;
        if (this.isAnswerCorrect) {
          this.jumpCharacter();
        }
      }, 4000);

      if (!this.isAnswerCorrect) {
        setTimeout(() => {
          //Mostrar modal si responde mal
          this.mostrarModal();
        }, this.tiempoMostrarModal);
      }
    } else {
      setTimeout(() => {
        this.onClickCambiar();
      }, 2000);
    }
  }

  reproducirSonido(nombreArchivo: string) {
    const audio = new Audio();
    audio.src = nombreArchivo;
    audio.load();
    audio.play();
  }

  //para el temporizador
  startMainTimer() {
    if (!this.isTimerRunning) {
      this.isTimerRunning = true; // Marca que el temporizador está en funcionamiento
      this.countdown = 20; // Restablece el tiempo en segundos
      this.mainTimerInterval = setInterval(() => {
        if (!this.userClicked) {
          this.countdown--; // Temporizador principal disminuye en segundos
        }
        if (this.countdown <= 0) {
          this.puedeResponder = false;
          this.userClicked = true;
          this.preguntaMalConstestada();
          this.stopTimer();
          this.pasarAOtraPregunta();
          this.Mensaje_error = 'Se acabo el tiempo';
        }
      }, 1000); // El temporizador principal se actualiza cada segundo (1000 ms)
    }
  }

  stopTimer() {
    clearInterval(this.mainTimerInterval); // Detiene el temporizador principal
    //this.countdown=20;
    this.isTimerRunning = false; // Marca que el temporizador ya no está en funcionamiento
  }

  resetTimer() {
    this.countdown = 20; // Reiniciar el tiempo en segundos
    this.userClicked = false; // Reiniciar el estado del usuario
    this.startMainTimer(); // Iniciar nuevamente el temporizador principal
  }

  onClickCambiar() {
    this.constantsService.loading(true);
    this.juegoTerminado = true;

    //RESULTADO RECOPILADOS
    console.log('Tiempo transcurrido=' + this.tiempoDelJugador);
    console.log('Puntos Jugador=' + this.puntosGanados);
    console.log('Juego terminado=' + this.juegoTerminado);

    this.puntosJugador.idUsuario = this.idJugador;
    this.puntosJugador.idSala = this.idSala;
    this.puntosJugador.puntaje = this.puntosGanados;
    this.puntosJugador.tiempo = this.tiempoDelJugador;

    //Cuando finalicé el juego directo a esta ventana
    this.musicaFondo?.pause();
    // @ts-ignore
    this.musicaFondo.currentTime = 0;
    //this.numVentanaH.emit(3); //1 para la ventana inicio sala, 2 para el juego y 3 para la ventana de resultados

    //console.log(this.puntosJugador);
    this.guardarPuntaje(this.puntosJugador);
  }

  guardarPuntaje(puntosJugador: PuntosJugador) {
    this.usuarioSalaService.crearRanking(puntosJugador).subscribe({
      next: (data: any) => {
        let { info, error } = data.result;
        //console.log(info);
        if (error > 0) {
          this.messageService.add({
            severity: 'error',
            summary: this.constantsService.mensajeError(),
            detail: 'ha ocurrido un error con la conexión',
          });
        } else {
          this.constantsService.loading(false);
          this.cambiarPag('/RankingChallengers', this.idSala);
        }
      },
      error: (e) => {
        if (e.status === 401) {
          this.router.navigate(['/']);
        }
      },
    });
  }

  setListOptions(iniciales: string, index: number): Options {
    let optionsAux = {
      floor: 0,
      ceil: this.cantidadDeBotones,
      showTicks: false,
      readOnly: true,
      translate: (value: number, label: LabelType): string => {
        switch (label) {
          case LabelType.Low:
            return iniciales;

          default:
            return '';
        }
      },
      getPointerColor: (value: number): string => {
        return this.colores[index];
      },
    };
    return optionsAux;
  }

  actualizarMiSlider() {
    const numPreguntas = this.listaDePreguntas.length;

    this.optionsMia = {
      readOnly: true,
      floor: 0,
      ceil: numPreguntas,
      showTicks: true,
      tickStep: 5,
      tickValueStep: 5,
      getPointerColor: (value: number): string => {
        return 'orange';
      },
      getSelectionBarColor: (): string => {
        return 'orange';
      },
      translate: (value: number, label: LabelType): string => {
        switch (label) {
          case LabelType.Low:
            return 'Tú';

          default:
            return '';
        }
      },
    };
  }

  cambiarPag(ruta: string, id: number) {
    let idSala = this.encryptionService.encrypt(id.toString());
    let params = { idSala };
    this.router.navigate([ruta], { queryParams: params });
  }
  //Carga las imagenes del juego
  cargarElementos(
    imgCharacterLeft: string,
    imgCharacterRight: string,
    gradientColor1: string,
    gradientColor2: string,
    imgPlatform1: string,
    imgPlatform2: string,
    imgPlatform3: string,
    imgPlatform4: string,
    isDecoration: number,
    imgDecoration1: string,
    imgDecoration2: string,
    imgDecoration3: string,
    imgDecoration4: string,
    isSkyObjects: number,
    imgSkyObject1: string,
    imgSkyObject2: string,
    isBackgroundObjects: number,
    imgBackgroundObjects1: string,
    imgBackgroundObjects2: string,
    imgBackgroundObjects3: string,
    imgBackgroundObjects4: string,
    imgBackgroundObjectsMovil: string,
    isFinalObject: number,
    imgFinalObject: string
  ) {
    //Colocar los elementos de la api
    this.characterSprite1 = imgCharacterLeft;
    this.characterSprite2 = imgCharacterRight;
    this.color1 = gradientColor1;
    this.color2 = gradientColor2;
    this.rutaPlataforma1 = imgPlatform1;
    this.rutaPlataforma2 = imgPlatform2;
    this.rutaPlataforma3 = imgPlatform3;
    this.rutaPlataforma4 = imgPlatform4;
    this.isDecoration = isDecoration == 1;
    this.rutaadorno1 = imgDecoration1;
    this.rutaadorno2 = imgDecoration2;
    this.rutaadorno3 = imgDecoration3;
    this.rutaadorno4 = imgDecoration4;
    this.isSkyObjects = isSkyObjects == 1;
    this.rutaObjetoFondo1 = imgSkyObject1;
    this.rutaObjetoFondo2 = imgSkyObject2;
    this.isBackgroundObjects = isBackgroundObjects == 1;
    this.rutaFondoDesk1 = imgBackgroundObjects1;
    this.rutaFondoDesk2 = imgBackgroundObjects2;
    this.rutaFondoDesk3 = imgBackgroundObjects3;
    this.rutaFondoDesk4 = imgBackgroundObjects4;
    this.rutaFondoMovil = imgBackgroundObjectsMovil;
    this.isFinalObject = isFinalObject == 1;
    this.rutaFinalObject = imgFinalObject;

    //console.log("this.isDecoration"+this.isDecoration);

    //Rellenar la escena
    this.cargarTexturasEscena();
  }

  cargarTexturasEscena() {
    this.loadFloorTextures();
    this.createFondo();
    this.yfloor1 = this.app.screen.height - 120;
    //Le coloco un time out para que los pisos y el personaje se coloquen despues del fondo
    setTimeout(() => {
      this.createFloors();
      this.createHero();

      this.app.ticker.add(this.update.bind(this));
      this.setupKeyboard();
    }, 120);
  }
}
