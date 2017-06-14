import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.js'

$(function() {
  ReactDOM.render(
    <h1>Boo yaa</h1>,
    document.getElementById('app')
  );
});
