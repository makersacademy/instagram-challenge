import React from 'react';
import ReactDOM from 'react-dom'
import { Link, Route, Switch } from 'react-router-dom';
import Form from '../Form/Form'

class Body extends React.Component {
  
  constructor(props) {
    super(props)
  }

  
  render() {
    if (this.props.authToken) {
      return (
        <div>
          <Posts />
        </div>
      )
    } else {
      return (
        <div>
          <Form updateAuthToken={this.props.updateAuthToken}
                authToken={this.props.authToken}/>
        </div>
      )
    }
  }
}

export default Body