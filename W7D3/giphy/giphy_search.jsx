import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {receiveSearchGiphys} from './actions/giphy_actions'
import {fetchSearchGiphys} from './actions/giphy_actions'

window.fetchSearchGiphys = fetchSearchGiphys;
window.receiveSearchGiphys = receiveSearchGiphys;
  const store = configureStore();
  window.store = store;

document.addEventListener('DOMContentLoaded', ()  => {
  const root = document.getElementById('root');
  ReactDOM.render(<root store={store} />, root);
});
