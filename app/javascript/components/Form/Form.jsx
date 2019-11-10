import React from 'react'
import ReactDOM from 'react-dom'
import Signup from './Signup'
import Login from './Login'
import { Route, Redirect } from 'react-router-dom';


class Form extends React.Component {

  constructor(props) {
    super(props)
  }

  render() {
    if (this.props.authToken) {
      return <Redirect to='/posts'/>
    } else {
        return (
          <div className='row'>
          <div key='formColLeft' className='col-2'></div>
          <div key='formColCentre' className='col'>
            <div className='container login-signup'>
            <Redirect from='/' to='/sign_up'/>
            <Route exact={true} path="/sign_up" 
                  render={
                    (props) => <Signup updateAuthToken={this.props.updateAuthToken
                  }/>
            }/>
            <Route exact={true}
                  path="/log_in" 
                  render={
                    (props) => <Login updateAuthToken={this.props.updateAuthToken
                  }/>
              }/>
            </div>
          </div>
          <div key='formColRight' className='col-2'></div>
        </div>
      )
    }
  }
}

export default Form