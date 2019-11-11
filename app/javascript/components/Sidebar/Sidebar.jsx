import React from 'react';
import ReactDOM from 'react-dom'
import { Redirect } from 'react-router-dom';
import axios from 'axios'

class Sidebar extends React.Component {
  
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className='sidebar'>
        <div className='card nav shadow rounded'>
          <div className='card-body'>
            <strong>{this.props.currentUser}</strong>
          </div>
          <div className ='card-footer footer-button'>
            <button className='btn btn-link sidebar-btn'>Profile</button>
          </div>
        </div>
      </div>
    )
  }
}

export default Sidebar