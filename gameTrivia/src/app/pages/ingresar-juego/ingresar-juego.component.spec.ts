import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresarJuegoComponent } from './ingresar-juego.component';

describe('IngresarJuegoComponent', () => {
  let component: IngresarJuegoComponent;
  let fixture: ComponentFixture<IngresarJuegoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [IngresarJuegoComponent]
    });
    fixture = TestBed.createComponent(IngresarJuegoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
