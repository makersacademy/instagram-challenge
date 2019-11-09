import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'


export default class Logout extends React.Component {
  constructor(props) {
    super(props)
    this.handleLogout = this.handleLogout.bind(this)
  }

  handleLogout(e) {
    e.preventDefault()
    let that = this
    this.props.updateAuthToken(null)
    this.props.changePage("login")
    // axios.delete('/users/sign_out', {
    // })
    // .then(function(response){
    //   console.log(response)
    // })
    // .catch(function(error) {
    //   console.log(error)
    // })
  }

  render() {
    return (
      <button onClick={this.handleLogout}>Sign out</button>
    )
  }
}