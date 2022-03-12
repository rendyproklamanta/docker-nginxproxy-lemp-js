import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {

  const BRANCH = process.env.REACT_APP_BRANCH;
  const NODE_ENV = process.env.NODE_ENV;

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />

        <p>Hi there!</p>
        <p>We use branch : {BRANCH}</p>
        <p>Node Environment : {NODE_ENV}</p>

        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
