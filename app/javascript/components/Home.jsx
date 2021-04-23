import React from "react";
// Link component is used to create hyperlinks
import { Link } from "react-router-dom";

export default () => (
  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <div className="container secondary-color">
        <h1 className="display-4">Instagram</h1>
        <hr className="my-4" />
        <Link
          to="/sign-up"
          className="btn btn-lg custom-button"
          role="button"
        >
          Sign up
        </Link>
        <Link
          to="/log-in"
          className="btn btn-lg custom-button"
          role="button"
        >
          Log in
        </Link>
      </div>
    </div>
  </div>
);