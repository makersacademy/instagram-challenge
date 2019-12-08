import React from 'react';
import ReactDOM from 'react-dom'
import { Redirect, Route } from 'react-router-dom';
import SessionForm from '../Form/SessionForm'
import Posts from '../Posts/Posts'
import Sidebar from '../Sidebar/Sidebar'

class Body extends React.Component {
  
  constructor(props) {
    super(props)
  }

  
  render() {
    if (this.props.authToken) {
      return (
        <div className='container'>
        <div className='row'>
          <div key='postsColLeft' className='col'>
            <Sidebar updateAuthToken={this.props.updateAuthToken}
                    authToken={this.props.authToken}
                    currentUser={this.props.currentUser}/>
          </div>
          <div key='postsColCentre' className='col-8'>
            <Route exact={true} path='/posts'
                  render={
                    (props) => <Posts updateAuthToken={this.props.updateAuthToken}
                                      authToken={this.props.authToken}
                                      currentUser={this.props.currentUser}/>
                  }/>
          </div>
          <div key='postsColRight' className='col'></div>
        </div>
      </div>
          // <Redirect to="/posts" />
      )
    } else {
      return (
        <div>
          <Redirect to="/sign_up" />
          <SessionForm updateAuthToken={this.props.updateAuthToken}
                authToken={this.props.authToken}/>
        </div>
      )
    }
  }
}

export default Body