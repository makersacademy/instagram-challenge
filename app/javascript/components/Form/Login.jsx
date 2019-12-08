import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import { Link, Redirect } from 'react-router-dom';
import Button from './Button'
import Input from '../Input/Input'

export default class Login extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      redirect: false
    }
    this.handleLogin = this.handleLogin.bind(this)
  }

  handleLogin(e) {
    e.preventDefault()
    let self = this
    let email = document.getElementById("email-input").value
    axios.post('/api/v1/auth', {
      email: email,
      password: document.getElementById("password-input").value,
    })
    .then(function(response) {
      self.setState({redirect: true})
      self.props.updateAuthToken(response.data.token, email)
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
          <h4>Log in</h4>
          <form onSubmit={e => {e.preventDefault();}}>
            <div className='form-input'>
              <Input label="Email"
                    type="email"
                    name="email" />
              <Input label="Password"
                    type="password"
                      name="password" />
            </div>
            <Button handleClick={this.handleLogin}
                    name='login'
                    class='primary'
                    label='Log In'/>
          </form>
          <Link to='/sign_up'>
            <Button name='singup'
                    class='secondary'
                    label='Sign Up'/>
          </Link>
        </div>
      )
    }
  }
}
