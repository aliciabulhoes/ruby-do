import React from 'react';
import ReactDOM from 'react-dom/client';
import Main from '../components/Main';

console.log('is this loading')

let root = ReactDOM.createRoot(
    document.getElementById('main'));

root.render(<Main greeting={'We finally made it'}/>)