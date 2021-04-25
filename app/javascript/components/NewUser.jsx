import React from "react";
import { Link } from "react-router-dom";

class NewUser extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      forename: "",
      lastname: "",
      username: "",
      password: ""
    };
    // methods bound to this object

    // Updates state
    this.onChange = this.onChange.bind(this);
    // Form submissions
    this.onSubmit = this.onSubmit.bind(this);
  }

  onChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();
    const url = "/api/v1/users/create";
    const { forename, lastname, username, password } = this.state;

    if (forename.length == 0 || lastname.length == 0 || username.length == 0, password.length == 0)
      return;

    const body = {
      forename,
      lastname, 
      username,
      password
    };

    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
        this.props.history.push("/");
        window.alert("Your account has been created, login!")
      })
      .catch(error => console.log(error.message));
  }
  render() {
    return (
      <div className="container mt-5">
        <div className="row">
          <div className="col-sm-12 col-lg-6 offset-lg-3">
            <h1 className="font-weight-normal mb-5">
              New User
            </h1>
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="forename">Forename</label>
                <input
                  type="text"
                  name="forename"
                  id="forename"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="lastname">Surname</label>
                <input
                  type="text"
                  name="lastname"
                  id="lastname"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="username">Username</label>
                <input
                  type="text"
                  name="username"
                  id="username"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="password">Password</label>
                <input
                  type="text"
                  name="password"
                  id="password"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
             
              <button type="submit" className="btn custom-button mt-3">
                Create User
              </button>
              <Link to="/" className="btn btn-link mt-3">
                Already a user? Log in here
              </Link>
            </form>
          </div>
        </div>
      </div>
    );
  }
}


export default NewUser;