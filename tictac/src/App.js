import logo from './logo.svg';
import React, { Component } from 'react';
import Person from './person/person';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>Does it work?</h1>
        <Person name='fuck'/>
        <Person name='ORANGE'/>
      </div>
    );
  }
}

export default App;