import React from "react";
import { Link } from "react-router-dom";

class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      username: '',
      password: '',
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
    const {username, password} = this.state 
    let user = {
      username: username,
      password: password
    }
    
    const url = "/api/login";
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
        if (response.json('logged_in')) {
          this.props.handleLogin(response)
          this.redirect()
        } else {
          this.props.handleLogout()
        }
        throw new Error("Network response was not ok.");
      })
    }
  
  redirect = () => {
    this.props.history.push('/')
  }

  handleErrors = () => {
    return (
      <div>
        <ul>
        {this.state.errors.map(error => {
          return <li key={error}>{error}</li>
        })}
        </ul>
      </div>
    )
  };

  render() {
    const {username, email, password} = this.state
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
        <h1 className="display-4">Log In</h1>        
        <form onSubmit={this.handleSubmit}>
          <label htmlFor="username">Username:</label><br></br>
          <input
            placeholder="username"
            type="text"
            name="username"
            required
            value={username}
            onChange={this.handleChange}
          /><br></br><br></br>
          <label htmlFor="password">Password:</label><br></br>
          <input
            placeholder="password"
            type="password"
            name="password"
            required
            value={password}
            onChange={this.handleChange}
          /><br></br>  
          <button placeholder="submit" type="submit" className="btn custom-button">
            Log In
          </button>
          <div>
            <Link to='/signup' className="btn custom-button">Sign Up</Link>
          </div>
        </form>
      </div>
    </>
    );
  }
}

export default Login;