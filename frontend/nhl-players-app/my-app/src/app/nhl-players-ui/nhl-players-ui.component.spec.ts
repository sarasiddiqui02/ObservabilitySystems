import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NhlPlayersUiComponent } from './nhl-players-ui.component';

describe('NhlPlayersUiComponent', () => {
  let component: NhlPlayersUiComponent;
  let fixture: ComponentFixture<NhlPlayersUiComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [NhlPlayersUiComponent]
    });
    fixture = TestBed.createComponent(NhlPlayersUiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
