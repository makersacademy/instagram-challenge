import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import HeaderLink from './HeaderLink'


export default class Logout extends React.Component {
  constructor(props) {
    super(props)
    this.handleLogout = this.handleLogout.bind(this)
  }

  handleLogout(e) {
    e.preventDefault()
    this.props.updateAuthToken(null)
  }

  render() {
    return (
      <HeaderLink handleClick={this.handleLogout}
                  label='Sign Out'
                  icon='log-out' />
    )
  }
}