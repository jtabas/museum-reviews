import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App'

let reactAppRender = element => {
  ReactDOM.render(
    <App />,
    element
  );
};


$(function() {
  let reactApp = document.getElementById('app');
  if (reactApp) {
    reactAppRender(reactApp);
  }
});
