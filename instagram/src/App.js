import React from 'react';
import './App.css';
import Footer from './components/footer';
import Header from './components/header';
import AddPost from './components/addPost';
import axios from 'axios';
import { HashRouter as Router } from 'react-router-dom';

function App(props) {
  return (
      <Router basename="/">
        <div className="App">
          <Header/>
          <AddPost/>
              <footer>
              <Footer/>
          </footer>
        </div>
    </Router>
  );
}

export default App;
