import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'


export default class Signup extends React.Component {

  constructor(props) {
    super(props)
    this.handleSignup = this.handleSignup.bind(this)
  }

  handleSignup(e) {
    e.preventDefault()
    let that = this
    axios.post('/users', {
      user: {
        email: document.getElementById("email").value,
        username: document.getElementById("username").value,
        password: document.getElementById("password").value,
        password_confirmation: document.getElementById("password_confirmation").value
      }
    })
    .then(function(response) {
      console.log(response)
      that.props.changePage("delete")
      that.props.updateCurrentUser(email)
    })
    .catch(function(error) {
      console.log(error)
    })
  }
  
  render() {
    return (
      <div>
        <h2>Signup</h2>
        <form>
          <input type="email" name="email" placeholder="Email" id="email"/>
          <input type="username" name="username" placeholder="Username" id="username"/>
          <input type="password" placeholder="Password" name="password" id="password"/>
          <input type="password" placeholder="Confirm Password" name="password_confirmation" id="password_confirmation"/>
          <button onClick={this.handleSignup}>Sign up</button>
        </form>
        <button onClick={() => this.props.changePage("login")}>Log in</button>
      </div>
    )
  }
}


