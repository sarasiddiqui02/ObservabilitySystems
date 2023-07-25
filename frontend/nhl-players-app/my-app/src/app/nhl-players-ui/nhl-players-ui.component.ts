import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-nhl-players-ui',
  templateUrl: './nhl-players-ui.component.html',
  styleUrls: ['./nhl-players-ui.component.scss']
})
export class NhlPlayersUiComponent implements OnInit {
  data: any[] = [];

  constructor(private http: HttpClient) { 
    //this.data = []
  }

  ngOnInit(): void {
    this.fetchData();
  }

  fetchData(): void {
    this.http.get<any[]>('http://192.168.64.12:3000/api/records').subscribe(
      (response) => {
        this.data = response;
      },
      (error) => {
        console.error('Error fetching data', error);
      }
    );
  }
}