import React from 'react';
import ReactDOM from 'react-dom'
import { Redirect } from 'react-router-dom';
import axios from 'axios'

class Posts extends React.Component {
  
  constructor(props) {
    super(props)
    this.state = {

    }
    this.getPosts = this.getPosts.bind(this)
  }

  getPosts() {

  }

  
  render() {
    console.log(this.props)
    return (
      <div className='container'>
        <div className='row'>
          <div key='postsColLeft' className='col-2'>
            <div className='sidebar'>
              <div className='card nav shadow rounded'>
                <div className='card-body'>
                  <strong>{this.props.currentUser}</strong>
                </div>
                <div className ='card-footer logout'>
                  <button className='btn btn-link sidebar-btn' type='submit'></button>
                </div>
              </div>
            </div>
          </div>
          <div key='postsColCentre' className='col-5'>
          </div>
          <div key='postsColRight' className='col'></div>
        </div>
      </div>
    )
  }
}

export default Posts