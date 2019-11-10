import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import Button from './Button/Button'
import Input from './Input/Input'


export default class Signup extends React.Component {

  constructor(props) {
    super(props)
    this.handleSignup = this.handleSignup.bind(this)
  }

  handleSignup(e) {
    e.preventDefault()
    let that = this
    let params =  {
      email: document.getElementById("email-input").value,
      password: document.getElementById("password-input").value,
      password_confirmation: document.getElementById("password_confirmation-input").value
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
        <h4>Sign Up</h4>
        <form>
          <div className='form-input'>
            <Input label="Email"
                   type="email"
                   name="email" />
            <Input label="Password"
                   type="password"
                   name="password" />
            <Input label="Password Confirmation"
                   type="password_confirmation"
                   name="password_confirmation" />
          </div>
          <Button handleClick={this.props.handleSignup}
                  class='primary'
                  label='Sign Up'
                  name='signup' />

        </form>
        <Button handleClick={() => this.props.changePage("login")}
                class='secondary' 
                label='Log In'
                name="login"/>
      </div>
    )
  }
}


