import { Injectable } from '@angular/core';
import { game1Model } from '../model/game1Model';

@Injectable({
  providedIn: 'root'
})
export class Game1Service implements game1Model {

  constructor() { }
  imgCharacterLeft: string;
  imgCharacterRight: string;
  gradientColor1: string;
  gradientColor2: string;
  imgPlatform1: string;
  imgPlatform2: string;
  imgPlatform3: string;
  imgPlatform4: string;
  isDecoration: number;
  imgDecoration1: string;
  imgDecoration2: string;
  imgDecoration3: string;
  imgDecoration4: string;
  isSkyObjects: number;
  imgSkyObject1: string;
  imgSkyObject2: string;
  isBacgroundObjects: number;
  imgBacgroundObjects1: string;
  imgBacgroundObjects2: string;
  imgBacgroundObjects3: string;
  imgBacgroundObjects4: string;
  imgBacgroundObjectsMovil: string;
  isFinalObject: number;
  imgFinalObject: string;
}
