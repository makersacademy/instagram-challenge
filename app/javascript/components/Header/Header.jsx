import React from 'react';
import ReactDOM from 'react-dom'
import axios from 'axios'
import Logout from './Logout';

class Header extends React.Component {
  constructor(props) {
    super(props)
    console.log(props)
  }

  sessionButton() {
    switch(this.props.page) {
      case "signup":
        return null
      case "delete":
        return <Logout updateAuthToken={this.props.updateAuthToken}
                       changePage={this.props.changePage}/>
    }
      
  }

  render() {
    return (
      <header>
        <nav className="navbar navbar-default">
          <div className="container-fluid">

            <div className="navbar-header">
              <a className="navbar-brand" href="#">Kevstagram</a>
            </div>
            <ul className="nav navbar-nav navbar-right">
              <li><a href="#"><span className="glyphicon glyphicon-user"></span>Profile</a></li>
              {this.sessionButton()}
            </ul>
          </div>
        </nav>
      </header>
    )
  }
}

export default Header