import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, combineLatest, forkJoin, map } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class TimeApiService {
  private apiUrl = 'https://worldtimeapi.org/api/timezone/Europe/London'; // URL de la API de WorldTimeAPI
  private localTimeUrl = 'https://worldtimeapi.org/api/ip'; // Obtener la hora local de la máquina

  constructor(private http: HttpClient) {}

  getLondonTime(): Observable<any> {
    return this.http.get(this.apiUrl);
  }

  // Método para obtener la diferencia de offset entre la zona horaria del usuario y la de Londres
  getOffsetDifference(): Observable<number> {
    // Realizar las solicitudes a las APIs de WorldTimeAPI para obtener los offsets
    const localOffset$ = this.http
      .get<any>(this.localTimeUrl)
      .pipe(map((data) => data.raw_offset));
    const londonOffset$ = this.http
      .get<any>(this.apiUrl)
      .pipe(map((data) => data.raw_offset));

    // Combinar los observables de offset y calcular la diferencia
    return combineLatest([localOffset$, londonOffset$]).pipe(
      map(([localOffset, londonOffset]) => {
        // Calcular la diferencia entre los offsets en segundos
        const offsetDifferenceSeconds = localOffset - londonOffset;

        // Convertir la diferencia de offset a horas
        const offsetDifferenceHours = offsetDifferenceSeconds / 3600;

        // Devolver la diferencia de offset en horas
        return offsetDifferenceHours;
      })
    );
  }

  convertToLondonTime(userDateTime: Date): Observable<Date> {
    // Realizar las solicitudes a las APIs de WorldTimeAPI para obtener los offsets
    const localOffset$ = this.http
      .get<any>(this.localTimeUrl)
      .pipe(map((data) => data.raw_offset));
    const londonOffset$ = this.http
      .get<any>(this.apiUrl)
      .pipe(map((data) => data.raw_offset));

    // Combinar los observables de offset y calcular la diferencia
    return combineLatest([localOffset$, londonOffset$]).pipe(
      map(([localOffset, londonOffset]) => {
        // Calcular la diferencia entre los offsets en segundos
        const offsetDifferenceSeconds = localOffset - londonOffset;

        // Convertir la diferencia de offset a horas
        const offsetDifferenceHours = offsetDifferenceSeconds / 3600;

        // Devolver la diferencia de offset en horas
        userDateTime.setHours(
          userDateTime.getHours() - offsetDifferenceHours + 1
        );
        //FIN CODIGO
        return userDateTime;
      })
    );
  }
}
