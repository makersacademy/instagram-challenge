import React from "react";
import { Link } from "react-router-dom";

class Post extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      post: "" 
    };
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

  // set the url to the post id
  const url = `/api/posts/${id}`;
  fetch(url)
    .then(response => {
      if (response.ok) {
        return response.json();
      }
      throw new Error("Network response was not ok.");
    })
    .then(response => this.setState({ post: response }))
    .catch(() => this.props.history.push("/posts/${id}"));
  }

  render() {
    const { post } = this.state;

    return (
      <div className="">
        <div className="hero position-relative d-flex align-items-center justify-content-center">
          <img
            src={post.image}
            alt={`${post.description} image`}
            className="img-fluid"
          />
        </div>
        <div className="card-body single">
          <h5 className='lead'>{post.description}</h5>
        </div>
      </div>
    );
  }

}
export default Post;