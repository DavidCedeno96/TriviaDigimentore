import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environments';
import { UsuarioService } from './usuario.service';
import { game1Model } from '../model/game1Model';

@Injectable({
  providedIn: 'root',
})
export class ComplementoService {
  private apiURL: string = environment.URL + '/api/Complemento';

  constructor(
    private http: HttpClient,
    private usuarioServicio: UsuarioService
  ) {}

  getItem(idSala: number): Observable<game1Model[]> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    return this.http.get<game1Model[]>(`${this.apiURL}/item/${idSala}`, {
      headers: headers,
    });
  }

  crearItem(formData: FormData): Observable<FormData> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    //headers.append('Access-Control-Allow-Credentials', 'true');
    return this.http.post<FormData>(`${this.apiURL}/create`, formData, {
      headers: headers,
    });
  }

  updateItem(formData: FormData): Observable<FormData> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.usuarioServicio.getToken()}`,
    });
    //headers.append('Access-Control-Allow-Credentials', 'true');
    return this.http.put<FormData>(`${this.apiURL}/update`, formData, {
      headers: headers,
    });
  }
}
