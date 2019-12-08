import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom';
import App from './App';


// ReactDOM.render(
class Router extends React.Component {
  render() {
    return (
      <BrowserRouter>
          <App />
      </BrowserRouter>
    )
  }
}

export default Router