import React from 'react';
import ReactDOM from 'react-dom'
import Form from './Form'
import axios from 'axios'
import Header from './Header/Header';

class App extends React.Component {
  
  constructor() {
    super()
    this.state = {
      authToken: null,
      page:"signup"
    }
    this.changePage = this.changePage.bind(this)
    this.updateAuthToken = this.updateAuthToken.bind(this)
  }

  getAuthToken() {
    return this.authToken
  }

  changePage(newPage) {
    this.setState({
      page: newPage
    })
  }

  updateAuthToken(token) {
    this.setState({
      authToken: token
    })
  }
  
  render() {
    return (
      <div>
        <Header updateAuthToken={this.updateAuthToken}
                authToken={this.state.authToken}
                changePage={this.changePage}
                page={this.state.page}/>
        <Form updateAuthToken={this.updateAuthToken}
              authToken={this.state.authToken}
              changePage={this.changePage}
              page={this.state.page}/>
      </div>
    )
  }
}

export default App