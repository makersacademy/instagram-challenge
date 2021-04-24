import React from "react";
import { Link } from "react-router-dom";

export default () => (
  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <div className="container secondary-color">
        <h1 className="display-4">Procrastagram</h1>
        <p className="lead">
          Beautiful images, stared at relentlessly, by people with better things to do.
        </p>
        <hr/>
        <Link
          to="/posts"
          className="btn btn-lg custom-button"
          role="button"
        >
          See Beautiful
        </Link>
      </div>
    </div>
  </div>
);