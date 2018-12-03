import React, { Component } from 'react';
// import './post.css'
// import * as serviceWorker from './serviceWorker';

class Post extends Component {
  deletePost(id) {
    fetch(`http://localhost:5000/api/messages/${id}`, {
      method: 'DELETE'
    })
    .then(res => res)
    .catch(err => err)
    window.location.reload()
  }

  render() {
    return (
      <div className='postWrapper' id={this.props.post._id}>
        <button className="deletebutton" onClick={this.deletePost.bind(this, this.props.post._id)}>Delete</button>
        <div className="message">{this.props.post.message}</div>
        <div className="date">{this.props.post.date}</div>
      </div>
    )
  }
}

export default Post
