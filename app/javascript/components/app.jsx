import React from "react";
import { BrowserRouter as Router, Route, Switch, Link } from "react-router-dom";
import Home from "../components/home";
import Posts from "../components/posts";
import Login from "../components/login";
import Nav from "../components/nav";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      isLoggedIn: false,
      user: {}
     };
  };

  componentDidMount() {
    this.loginStatus()
  }

  loginStatus = () => {
    const url = "/api/logged_in";
    fetch(url, { credentials: 'include' })
    .then(response => {
      if (response.json('logged_in')) {
        this.handleLogin(response)
      } else {
        this.handleLogout()
      }
    })
    // .catch(() => this.props.history.push("/"));
  }

  handleLogin = (data) => {
    this.setState({
      isLoggedIn: true,
      user: data.user
    })
  }

  handleLogout = () => {
    this.setState({
    isLoggedIn: false,
    user: {}
    })
  }

  render() {
    return(
      <Router>
        <div>
          <Route render={props => (
            <Nav {...props} handleLogout={this.handleLogout} loggedInStatus={this.state.isLoggedIn}/>
            )}
          />
        </div>
        <Switch>
          <Route exact path='/' render={props => (
            <Home {...props} handleLogout={this.handleLogout} loggedInStatus={this.state.isLoggedIn}/>
            )}
          />
          <Route path='/posts' render={props => (
            <Posts {...props} handleLogin={this.handleLogin} loggedInStatus={this.state.isLoggedIn}/>
            )}
          />
          <Route path='/login' render={props => (
            <Login {...props} handleLogin={this.handleLogin} loggedInStatus={this.state.isLoggedIn}/>
            )}
          />
        </Switch>
      </Router>
    );
  }
}
export default App;
