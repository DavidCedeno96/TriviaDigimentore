import { Injectable } from '@angular/core';
import { imagenesModel } from '../model/imagenesModel';

@Injectable({
  providedIn: 'root'
})
export class ImagenesService implements imagenesModel {

  _isotipo: string = "";
  _logoColores: string = "";
  _logoBlanco: string = "";

  constructor() {
    this._isotipo = "assets/Imagenes Empresa/isotipo.png";
    this._logoColores = "assets/Imagenes Empresa/Logo Colores.png";
    this._logoBlanco = "assets/Imagenes Empresa/logo blanco.png";
   }
 

  get isotipo(): string {
    return this._isotipo;
  }

  set isotipo(value: string) {
    this._isotipo = value;
  }

  get logoColores(): string {
    return this._logoColores;
  }

  set logoColores(value: string) {
    this._logoColores = value;
  }

  get logoBlanco(): string {
    return this._logoBlanco;
  }

  set logoBlanco(value: string) {
    this._logoBlanco = value;
  }
   
  
}
