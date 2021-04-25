import React, { Component } from 'react';

class Signup extends Component {
  constructor(props) {
    super(props);
    this.state = {
      forename: '',
      surname: '', 
      username: '',
      profile_picture: '',
      email: '',
      password: '',
      password_confirmation: '',
      errors: ''
     };
  }

  handleChange = (event) => {
    const {name, value} = event.target
    this.setState({
      [name]: value
    })
  };

  handleSubmit = (event) => {
    event.preventDefault()
    const {forename, surname, username, email, profile_picture, password, password_confirmation} = this.state
    let user = {
      forename: forename,
      surname: surname,
      username: username,
      email: email,
      profile_picture: profile_picture,
      password: password,
      password_confirmation: password_confirmation
    }

    const url = "/api/users";
    fetch(url, {
      method: 'POST',
      mode: 'cors',
      cache: 'default',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: JSON.stringify(user)
      })
    .then(response => {
      if (response.json('status') === 'created') {
        this.props.handleLogin(response)
        return this.redirect()
      } else {
        this.setState({
          errors: response.json(errors)
        })
      }
    })
    .catch(error => console.log('api errors:', error))
  };

  redirect = () => {
    this.props.history.push('/')
  }

  handleErrors = () => {
    return (
      <div>
        <ul>{this.state.errors.map((error) => {
          return <li key={error}>{error}</li>
        })}</ul> 
      </div>
    )
  }

  render() {
    const {forename, surname, username, email, profile_picture, password, password_confirmation} = this.state
  return (
    <>
      <div className="container py-5">
        <h1 className="display-4">Procrastagram</h1>
          <p className="lead">
            Sit, relax, you've got important things to do. So why not spend some time
            aimlessly scrolling through images. It's your life, waste it.
          </p>
        <hr/>
      </div>
        <div className="container py-5">
          <h1 className='display-4'>Sign Up</h1>
            <form onSubmit={this.handleSubmit}>
            <label htmlFor="forename">Forename:</label><br></br>
            <input
              placeholder="forename"
              type="text"
              name="forename"
              value={forename}
              onChange={this.handleChange}
            /><br></br><br></br>
            <label htmlFor="surname">Surname:</label><br></br>
            <input
              placeholder="surname"
              type="text"
              name="surname"
              value={surname}
              onChange={this.handleChange}
            /><br></br><br></br>
            <label htmlFor="username">Username:</label><br></br>
            <input
              placeholder="username"
              type="text"
              name="username"
              value={username}
              onChange={this.handleChange}
            /><br></br><br></br>
            <label htmlFor="profile_picture">Profile Picture:</label><br></br>
            <input
              placeholder="link to picture"
              type="text"
              name="profile_picture"
              value={profile_picture}
              onChange={this.handleChange}
            /><br></br><br></br>
            <label htmlFor="email">Email:</label><br></br>
            <input
              placeholder="email"
              type="text"
              name="email"
              value={email}
              onChange={this.handleChange}
            /><br></br><br></br>
            <label htmlFor="password">Password:</label><br></br>
            <input 
              placeholder="password"
              type="password"
              name="password"
              value={password}
              onChange={this.handleChange}
            /><br></br><br></br>
            <label htmlFor="password_confirmation">
            Password Confirmation:</label><br></br>
            <input
              placeholder="password confirmation"
              type="password"
              name="password_confirmation"
              value={password_confirmation}
              onChange={this.handleChange}
            /><br></br><br></br>
          
            <button placeholder="submit" type="submit" className="btn custom-button">
              Sign Up
            </button>
        
          </form>
          <div>
            {
              this.state.errors ? this.handleErrors() : null
            }
          </div>
        </div>
      </>
    );
  }
}
export default Signup;