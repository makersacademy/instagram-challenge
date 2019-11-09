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
    let params =  {
      email: document.getElementById("email").value,
      password: document.getElementById("password").value,
      password_confirmation: document.getElementById("password_confirmation").value
    }
    axios.post('/api/v1/users', params)
    .then(function(response) {
      console.log(response)
      if(response.data.success) {
        axios.post('/api/v1/auth', params)
        .then(function(response) {
          that.props.changePage("delete")
          that.props.updateAuthToken(response.data.token)
        })
      }
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
          <label htmlFor="email">Email:</label>
          <input type="email" name="email" placeholder="Email" id="email"/>
          <label htmlFor="password">Password:</label>
          <input type="password" placeholder="Password" name="password" id="password"/>
          <label htmlFor="password_confirmation">Confirm Password:</label>
          <input type="password" placeholder="Confirm Password" name="password_confirmation" id="password_confirmation"/>
          <button onClick={this.handleSignup}>Sign up</button>
        </form>
        <button onClick={() => this.props.changePage("login")}>Log in</button>
      </div>
    )
  }
}


