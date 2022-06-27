import React from 'react';
import ReactDOM from 'react-dom/client';
import Main from '../components/Main';

const main = document.getElementById('main') as HTMLElement;

const root = ReactDOM.createRoot(main);

root.render(<Main greeting={'We finally made it'}/>)
