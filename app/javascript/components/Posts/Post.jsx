import React from 'react'
import ReactDOM from 'react-dom'

class Post extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className='card'>
        <div className='container'>
          <div className='post-image-container'>
            <img className='post-image' src={this.props.url} alt=""/>
          </div>
          <div className='post-username'>
            <strong><small>{this.props.email}</small></strong>
          </div>
          <div className='post-caption'>
            <p>{this.props.caption}</p>
          </div>
        </div>
        <div className='card-footer post-created-at'>
          <small>{this.props.createdAt}</small>
        </div>
      </div>
    )
  }
}

export default Post