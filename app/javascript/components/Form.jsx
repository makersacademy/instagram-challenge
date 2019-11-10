import React from 'react'
import ReactDOM from 'react-dom'
import Signup from './Signup'
import Login from './Login'

class Form extends React.Component {

  constructor(props) {
    super(props)
  }

  renderForm() {
    switch(this.props.page) {
      case "signup":
        return <Signup changePage={this.props.changePage}
        updateAuthToken={this.props.updateAuthToken} />
      case "login":
        return <Login changePage={this.props.changePage}
        updateAuthToken={this.props.updateAuthToken} />
    }
  }

  render() {
    return (
      <div className='row'>
        <div key='formColLeft' className='col-2'></div>
        <div key='formColCentre' className='col'>
          <div className='container login-signup'>
          {this.renderForm()}
          </div>
        </div>
        <div key='formColRight' className='col-2'></div>
      </div>
    )
  }
}

export default Form