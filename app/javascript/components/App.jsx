import React from 'react';
import ReactDOM from 'react-dom'
import Body from './Body/Body'
import Header from './Header/Header';

class App extends React.Component {
  
  constructor() {
    super()
    this.state = {
      authToken: null,
      currentUser: null
    }
    this.updateAuthToken = this.updateAuthToken.bind(this)
  }

  updateAuthToken(token, email) {
    this.setState({
      authToken: token,
      currentUser: email,
    })
  }
  
  render() {
    return (
      <div>
        <Header currentUser={this.currentUser}
                updateAuthToken={this.updateAuthToken}
                authToken={this.state.authToken}/>
                
        <Body currentUser={this.state.currentUser}
              updateAuthToken={this.updateAuthToken}
              authToken={this.state.authToken}/>
      </div>
    )
  }
}

export default App