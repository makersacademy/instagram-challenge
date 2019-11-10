import React from 'react';
import ReactDOM from 'react-dom'
import Body from './Body/Body'
import Header from './Header/Header';

class App extends React.Component {
  
  constructor() {
    super()
    this.state = {
      authToken: null,
    }
    this.updateAuthToken = this.updateAuthToken.bind(this)
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
                authToken={this.state.authToken}/>
                
        <Body updateAuthToken={this.updateAuthToken}
                authToken={this.state.authToken}/>
      </div>
    )
  }
}

export default App