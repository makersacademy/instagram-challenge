import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import { Link, Redirect } from 'react-router-dom';
import Button from './Button'
import Input from '../Input/Input'


export default class Signup extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      redirect: false
    }
    this.handleSignup = this.handleSignup.bind(this)
  }

  handleSignup(e) {
    e.preventDefault()
    let self = this
    let email = document.getElementById("email-input").value
    let params =  {
      email: email,
      password: document.getElementById("password-input").value,
      password_confirmation: document.getElementById("password_confirmation-input").value
    }
    axios.post('/api/v1/users', params)
    .then(function(response) {
      if(response.data.success) {
        axios.post('/api/v1/auth', params)
        .then(function(response) {
          self.setState({redirect: true})
          self.props.updateAuthToken(response.data.token, email)
        })
      }
    })
    .catch(function(error) {
      console.log(error)
    })
  }
  
  render() {
    if (this.state.redirect) {
      return (
        <Redirect to='/posts'/>
      )
    } else {
      return (
        <div>
          <h4>Sign Up</h4>
          <form onSubmit={e => {e.preventDefault();}}>
            <div className='form-input'>
              <Input label="Email"
                    type="email"
                    name="email" />
              <Input label="Password"
                    type="password"
                    name="password" />
              <Input label="Password Confirmation"
                    type="password"
                    name="password_confirmation" />
            </div>
            <Button handleClick={this.handleSignup}
                    class='primary'
                    label='Sign Up'
                    name='signup' />
          </form>
          <Link to='/log_in'>
            <Button class='secondary' 
                    label='Log In'
                    name="login"/>
          </Link>
        </div>
      )
    }
  }
}


