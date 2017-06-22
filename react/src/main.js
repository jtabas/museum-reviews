import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import MuseumsContainer from './containers/MuseumsContainer';

$(function () {
  let app = document.getElementById('app')
  if (app) {
    ReactDOM.render(
      <MuseumsContainer />,
      app
    );
  }
});
