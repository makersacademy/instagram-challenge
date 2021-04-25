import React, { Component } from 'react';
import './App.css';
import Header from './components/Header';
import Post from './components/Post'

class App extends Component {
  render() {
    return <div className="App">
      <Header />
      <section className="App-main">
        <Post nickname="Su-z" avatar="https://i.ytimg.com/vi/knlJBy1eHyw/hqdefault.jpg" image="https://i.imgflip.com/53l81f.jpg" caption="bring back the Vine!"/>
      </section>
    </div>;
  }
}

export default App;
