import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'

export default class Login extends React.Component {

  constructor(props) {
    super(props)
    this.handleLogin = this.handleLogin.bind(this)
  }

  handleLogin(e) {
    e.preventDefault()
    let that = this
    axios.post('/api/v1/auth', {
      user: {
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
      }
    })
    .then(function(response) {
      console.log(response)
      that.props.changePage("delete")
      that.props.updateAuthToken(response.data.token)
    })
    .catch(function(error) {
      console.log(error)
    })
  }
  
  render() {
    return (
      <div>
        <h2>Log in</h2>
        <form>
          <input type="email" name="email" placeholder="Email" id="email"/>
          <input type="password" placeholder="Password" name="password" id="password"/>
          <button onClick={this.handleLogin}>Log in</button>
        </form>
        <button onClick={() => this.props.changePage("signup")}>Sign up</button>
      </div>
    )
  }
}