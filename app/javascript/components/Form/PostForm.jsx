import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import { Route, Redirect } from 'react-router-dom';
import Button from './Button'

class PostForm extends React.Component {

  constructor(props) {
    super(props)
    this.handlePost = this.handlePost.bind(this)
  }

  handlePost() {
    let self = this
    axios({
      url: '/api/v1/posts',
      method: 'POST',
      headers: {
        "ACCEPT": "application/json",
        "Authorisation": self.props.authToken
      },
      data: { post: {
          url: document.getElementById('url').value,
          caption: document.getElementById('caption').value
        }
      }
    }).then(function(response) {
      self.props.getPosts()
    }).catch(function(error) {
      console.log(error)
    })
  }


  render() {
    return (
      <div>
        <div className='card post-form'>
          <div className='container'>
            <div className='post-form-container'>
              <form onSubmit={e => {e.preventDefault();}}>
                <div className="form-group">
                  <input id="url" name="url" placeholder="https://www.imgur.com/cute-cat.jpeg" type="text" className="form-control"></input>
                </div>
                <div className="form-group">
                  <label htmlFor="caption">Caption:</label> 
                  <textarea id="caption" name="caption" cols="40" rows="3" className="form-control"></textarea>
                </div> 
                <div className="form-group">
                <Button handleClick={this.handlePost}
                        name='submit'
                        class='primary'
                        label='Submit'/>
                </div>
              </form>            
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default PostForm