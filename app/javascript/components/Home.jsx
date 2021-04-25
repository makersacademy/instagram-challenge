import React from "react";
// Link component is used to create hyperlinks
import { Link } from "react-router-dom";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
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
    const { username, password } = this.state;

    if (username.length == 0, password.length == 0)
      return;

    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(`/api/v1/users/authenticate/${this.state.username}/${this.state.password}`, {
      method: "GET",
    })
      .then(response => {
        console.log(response)
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
        console.log(response)
        if (response == null ) {
          console.log("request returned nil")

          window.alert("Incorrect username or password, try again or signup")
          this.props.history.push("/");
          document.getElementById("login_form").reset();
          return;
        };
        console.log("request valid")

        localStorage.setItem("id", response.id)
        // CHANGE TO POSTS PAGE
        this.props.history.push("/");
        window.alert(`Welcome back to instagram ${response.forename}`)
      })
      .catch(error => console.log(error.message));
  }

  render() {
    return (
      <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
        <div className="jumbotron jumbotron-fluid bg-transparent">
          <div className="container secondary-color">
            <h1 className="display-4">Instagram</h1>
            <hr className="my-4" />

            <form onSubmit={this.onSubmit} id="login_form">
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
              <Link
                to="/sign-up"
                className="btn btn-lg custom-button"
                role="button"
              >
                Sign up
              </Link>
              <button type="submit" className="btn btn-lg custom-button" id='login'>
                Login
              </button>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default Home;