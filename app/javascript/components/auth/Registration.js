import React, { useState, useEffect } from "react";
import axios from "axios";
import InputGroup from "react-bootstrap/InputGroup";
import FormControl from "react-bootstrap/FormControl";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";

class Registration extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      email: "",
      password: "",
      profile_photo: ""
    };
  }

  handleUsernameChange = event => {
    this.setState({
      username: event.target.value
    });
  };

  handleEmailChange = event => {
    this.setState({
      email: event.target.value
    });
  };

  handlePasswordChange = event => {
    this.setState({
      password: event.target.value
    });
  };

  handleProfilePhotoChange = event => {
    this.setState({
      profile_photo: event.target.value
    });
  };

  handleSubmit = event => {
      event.preventDefault();
      const newUser = { "username": `${this.state.username}`, "email":`${this.state.email}`, "password": `${this.state.password}`, "profile_photo": `${this.state.profile_photo}` };
      axios.post('/api/v1/users', newUser)
      .then(response => {
        this.setState(response.data.id)
        this.props.history.push('/')
      })
      .catch(error => {
        this.setState({ errorMessage: error.message });
        console.error('There was an error!', error);
    });
  };

  render() {
    const { username, email, password, profile_photo } = this.state;

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <h1>Join InstaMiligram Today</h1>

          <Form.Group controlId="formBasicUsername" className="w-25 p-3">
            <Form.Label>Username</Form.Label>
            <Form.Control
              type="text"
              placeholder="Enter username"
              required
              value={username}
              onChange={this.handleUsernameChange}
            />
          </Form.Group>

          <Form.Group controlId="formBasicEmail" className="w-25 p-3">
            <Form.Label>Email address</Form.Label>
            <Form.Control
              type="email"
              placeholder="Enter email"
              required
              value={email}
              onChange={this.handleEmailChange}
            />
            <Form.Text className="text-muted">
              We'll never share your email with anyone else.
            </Form.Text>
          </Form.Group>

          <Form.Group controlId="formBasicPassword" className="w-25 p-3">
            <Form.Label>Password</Form.Label>
            <Form.Control
              type="password"
              placeholder="Password"
              required
              value={password}
              onChange={this.handlePasswordChange}
            />
            <Form.Text id="passwordHelpBlock" muted>
              Must be 8-20 characters long.
            </Form.Text>
          </Form.Group>

          <Form.Group controlId="formBasicProfilePhoto" className="w-25 p-3">
            <Form.Label>Profile Photo (URL)</Form.Label>
            <Form.Control
              type="text"
              placeholder="Profile Photo"
              required
              value={profile_photo}
              onChange={this.handleProfilePhotoChange}
            />
          </Form.Group>
          <Button variant="primary" type="submit">
            Submit
          </Button>
        </form>
      </div>
    );
  }
}

export default Registration;
