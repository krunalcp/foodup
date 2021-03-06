import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class HostappService {

  constructor() { }

  public getHost(){
    const environment: any = window.location.hostname;

    if (environment == 'localhost'){
      return "http://localhost:3000"
    }
    else if (environment == 'ctordering.herokuapp.com'){
      return "https://ctordering.herokuapp.com"
    }
    else if (environment == 'ctordering-test.herokuapp.com'){
      return "https://ctordering-test.herokuapp.com"
    }
  }

  public isTestSite() {
    const environment: any = window.location.hostname;

    if (environment == 'localhost'){
      return true
    }
    else if (environment == 'ctordering.herokuapp.com'){
      return false
    }
    else if (environment == 'ctordering-test.herokuapp.com'){
      return true
    }
  }
}
