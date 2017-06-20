import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import MuseumsContainer from './components/MuseumsContainer';

$( function() {
  ReactDOM.render(
    <MuseumsContainer />,
    document.getElementById('app')
  );
});
