import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import Button from './Button/Button'
import Input from './Input/Input'

export default class Login extends React.Component {

  constructor(props) {
    super(props)
    this.handleLogin = this.handleLogin.bind(this)
  }

  handleLogin(e) {
    e.preventDefault()
    let that = this
    axios.post('/api/v1/auth', {
      email: document.getElementById("email-input").value,
      password: document.getElementById("password-input").value,
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
        <h4>Log in</h4>
        <form>
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
        <Button handleClick={() => this.props.changePage("signup")}
                name='singup'
                class='secondary'
                label='Sign Up'/>
      </div>
    )
  }
}