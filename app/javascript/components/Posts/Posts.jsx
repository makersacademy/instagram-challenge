import React from 'react';
import ReactDOM from 'react-dom'
import axios from 'axios'
import Post from './Post'
import PostForm from '../Form/PostForm'

class Posts extends React.Component {
  
  constructor(props) {
    super(props)
    this.state = {
      posts: null
    }
    this.getPosts = this.getPosts.bind(this)
  }

  componentDidMount() {
    this.getPosts()
  }

  getPosts() {
    var self = this 
    axios({
      url: '/api/v1/posts',
      headers: {
        "ACCEPT": "application/json",
        "Authorisation": self.props.authToken
      }
    })
    .then(function(response) {
      self.setState({posts: response.data})
    })
    .catch(function(error) {
      console.log(error)
    })
  }

  render() {
    console.log(this.state.posts)
    if (this.state.posts !== null) {
      return (
        <div className='post-list'>
          <PostForm authToken={this.props.authToken}
                    getPosts={this.getPosts}/>
          {this.state.posts.map(post => <Post key={post.id}
                                               email={post.user.email} 
                                               caption={post.caption} 
                                               createdAt={post.created_at} 
                                               url={post.url}/>)}
        </div> 
      )
    } else {
      return (
        <div></div>
      )
    }
  }
}

export default Posts