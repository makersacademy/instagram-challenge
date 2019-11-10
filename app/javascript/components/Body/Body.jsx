import React from 'react';
import ReactDOM from 'react-dom'
import { Redirect } from 'react-router-dom';
import Form from '../Form/Form'
import Posts from '../Posts/Posts'

class Body extends React.Component {
  
  constructor(props) {
    super(props)
  }

  
  render() {
    if (this.props.authToken) {
      return (
        <div>
          <Redirect to="/posts" />
          <Posts updateAuthToken={this.props.updateAuthToken}
                 authToken={this.props.authToken}
                 currentUser={this.props.currentUser}/>
        </div>
      )
    } else {
      return (
        <div>
          <Redirect to="/sign_up" />
          <Form updateAuthToken={this.props.updateAuthToken}
                authToken={this.props.authToken}/>
        </div>
      )
    }
  }
}

export default Body