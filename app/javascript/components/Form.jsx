import React from 'react'
import ReactDOM from 'react-dom'
import Signup from './Signup'
import Login from './Login'
import Logout from './Logout'

class Form extends React.Component {

  constructor(props) {
    super(props)
    if (this.props.authToken == null) {
      this.state = {
        page:"signup"
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
        updateAuthToken={this.props.updateAuthToken} />
      case "login":
        return <Login changePage={this.changePage}
        updateAuthToken={this.props.updateAuthToken} />
      case "delete":
        return <Logout changePage={this.changePage}
        updateAuthToken={this.props.updateAuthToken}/>
    }
  }
}

export default Form