import React from 'react';
import './App.css';
import Navigation from './components/navigation';
import Footer from './components/footer';
import Header from './components/header';
import AddPost from './components/addPost';
import SeePost from './components/seePost';
import { HashRouter as Router, Route, NavLink } from 'react-router-dom';

function App(props) {
  return (
      <Router basename="/">
        <div className="App">
          <header className="App-header">
          <Header/>
              <img src={props.image}/>
              <p>{props.image}</p>
            <div className="PageSwitcher">
            <NavLink to="/newpost" activeClassName="PageSwitcher__Item--Active" className="PageSwitcher__Item">New Post</NavLink>
               <NavLink exact to="/" activeClassName="PageSwitcher__Item--Active" className="PageSwitcher__Item">Posts</NavLink>
                </div>
              </header>
              <footer>
              <Footer/>
              </footer>
            </div>

    <Route path="/posts"exact component={SeePost}/>
    <Route path="/newpost" exact component={AddPost} />
  </Router>
  );
}

export default App;
