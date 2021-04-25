import React from "react";
// Link component is used to create hyperlinks
import { Link } from "react-router-dom";

export default () => (
  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <div className="container secondary-color">
        <h1 className="display-4">Instagram</h1>
        <hr className="my-4" />

        {/* Need to define onSubmit and other functions */}
        {/* <form onSubmit={this.onSubmit}>  */}
        <form>
          <div className="form-group">
            <label htmlFor="username">Username</label>
            <input
              type="text"
              name="username"
              id="username"
              className="form-control"
              required
              // onChange={this.onChange}
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
              // onChange={this.onChange}
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