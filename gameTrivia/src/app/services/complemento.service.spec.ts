import { TestBed } from '@angular/core/testing';

import { ComplementoService } from './complemento.service';

describe('ComplementoService', () => {
  let service: ComplementoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ComplementoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
