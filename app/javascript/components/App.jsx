import React from 'react';
import ReactDOM from 'react-dom'
import Header from './Header'

class App extends React.Component {
  
  constructor() {
    super()
    this.state = {
      currentUser: null
    }
    this.updateCurrentUser = this.updateCurrentUser.bind(this)
  }

  componentDidMount() {
    let that = this
    axios.get('/users/check_for_user', {
    })
    .then(function(response){
      if(response.data.email){
        that.setState({
          currentUser: response.data.email
        })
      } else {
        that.setState({
          currentUser: null
        })
      }
    })
    .catch(function(error){
      console.log(error)
    })
  }

  updateCurrentUser(email) {
    this.setState({
      currentUser: email
    })
  }

  render() {
    return (
      <div>
        <Header updateCurrentUser={this.updateCurrentUser}/>
      </div>
    )
  }
}

export default Header