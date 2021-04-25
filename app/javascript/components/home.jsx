import React from "react";
import { Link } from "react-router-dom";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }
  
  render() {
    console.log(this.props.loggedInStatus)

    return (
      <div className="vh-100 primary-color d-flex align-items-center justify-content-center">
        <div className="jumbotron jumbotron-fluid bg-transparent">
          <div className="container secondary-color">
            <h1 className="display-4">Procrastagram</h1>
            <p className="lead">
              Beautiful images, stared at relentlessly, by  with better things to do.
            </p>people
            <hr/>
            <Link to="/posts" className="btn btn-lg custom-button" role="button" >
              See Beautiful
            </Link>
            { !this.props.loggedInStatus ?
            <Link to="/login" className="btn btn-lg custom-button" role="button">
              Sign In
            </Link> : null
            }
            { !this.props.loggedInStatus ?
            <Link to="/signup" className="btn btn-lg custom-button" role="button">
              Sign Up
            </Link> : null 
            }
          </div>
        </div>
      </div>
    );
  }
}

export default Home;