import React from 'react'
import ReactDOM from 'react-dom'
import Signup from './Signup'
import Login from './Login'
import Logout from './Logout'

class Form extends React.Component {

  constructor(props) {
    super(props)
    if (this.props.currentUser == null) {
      this.state = {
        page:"login"
      } 
    } else {
      this.state = {
        page:"delete"
      }
    }
    this.changePage = this.changePage.bind(this)
  }

  changePage(newPage) {
    this.setState({
      page: newPage
    })
  }

  render() {
    switch(this.state.page) {
      case "signup":
        return <Signup changePage={this.changePage}
        updateCurrentUser={this.props.updateCurrentUser} />
      case "login":
        return <Login changePage={this.changePage}
        updateCurrentUser={this.props.updateCurrentUser} />
      case "delete":
        return <Logout changePage={this.changePage}
        updateCurrentUser={this.props.updateCurrentUser}/>
    }
  }
}

export default Header