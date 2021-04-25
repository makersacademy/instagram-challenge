import React from 'react';
import { Link } from 'react-router-dom';

class Nav extends React.Component {
  constructor(props) {
    super(props);
    this.state = { clicked: false }

    // this.setNav = this.setNav.bind(this);
  }

  logoutClick = () => {
      const url = "/api/logout";
      fetch(url, {
        method: 'POST',
        mode: 'cors',
        cache: 'default',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json',
        },
        redirect: 'follow',
        referrerPolicy: 'no-referrer'
      })
      .then(response => {
        this.props.handleLogout()
        this.props.history.push("/")
      })
      .catch(error => console.log(error))
    }

  setNav = (event) => {
    event.preventDefault();

    this.setState({ clicked : !this.state.clicked }); 

    var nav = document.getElementById("topnav");
    if (nav.className === "nav") {
      nav.className += " responsive";
    } else {
      nav.className = "nav";
    }
  }

  render() {
    return (
      <div className="nav" id='topnav'>
        <Link to="/" className="active">Procrastagram</Link>
        <Link to="/posts">Posts</Link>
        { 
        this.props.loggedInStatus ?
        <Link to="/posts/new">Create New Post</Link>: null 
        }
        { 
        !this.props.loggedInStatus ?
        <Link to="/Login">Sign In</Link>: null 
        }
        { 
        !this.props.loggedInStatus ?
        <Link to="/signup">Sign Up</Link>: null 
        }
        { 
        this.props.loggedInStatus ?
        <Link to="/logout" onClick={ this.logoutClick } className='signout'>Sign Out</Link>: null 
        }
        <a href="#" className="icon" onClick={ this.setNav }>
          <i className={ this.state.clicked ? "fa fa-times" : "fa fa-bars" }></i>
        </a>
      </div>
    );
  }
}
export default Nav;