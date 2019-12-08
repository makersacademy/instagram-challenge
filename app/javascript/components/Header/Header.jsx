import React from 'react';
import ReactDOM from 'react-dom'
import axios from 'axios'
import { Link } from 'react-router-dom';
import Logout from './Logout';

class Header extends React.Component {
  constructor(props) {
    super(props)
  }

  sessionButton() {
    if (this.props.authToken) {
      return <Logout updateAuthToken={this.props.updateAuthToken}
                     changePage={this.props.changePage}/>
    } else {
      return null
    }
  }

  render() {
    return (
      <header>
        <nav className="navbar navbar-default">
          <div className="container-fluid">

            <div className="navbar-header">
              <Link className="navbar-brand" to='/'>Kevstagram</Link>
            </div>
            <ul className="nav navbar-nav navbar-right">
              {/* <li><Link to='/profile'><span className="glyphicon glyphicon-user"></span>Profile</Link></li> */}
              {this.sessionButton()}
            </ul>
          </div>
        </nav>
      </header>
    )
  }
}

export default Header