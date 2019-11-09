import React from 'react';
import ReactDOM from 'react-dom'
import Form from './Form'
import axios from 'axios'

class App extends React.Component {
  
  constructor() {
    super()
    this.state = {
      authToken: null
    }
    this.updateAuthToken = this.updateAuthToken.bind(this)
  }

  // componentDidMount() {
  //   let that = this
  //   axios.get('/users/check_for_user', {
  //   })
  //   .then(function(response){
  //     if(response.data.token){
  //       that.setState({
  //         authToken: response.data.token
  //       })
  //     } else {
  //       that.setState({
  //         authToken: null
  //       })
  //     }
  //   })
  //   .catch(function(error){
  //     console.log(error)
  //   })
  // }

  updateAuthToken(token) {
    this.setState({
      authToken: token
    })
  }
  
  render() {
    return (
      <div>
        <Form updateAuthToken={this.updateAuthToken} />
      </div>
    )
  }
}

export default App