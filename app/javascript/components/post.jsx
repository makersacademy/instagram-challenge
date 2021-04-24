import React from "react";
import { Link } from "react-router-dom";

class Post extends React.Component {
  constructor(props) {
    super(props);
    this.state = { Post: { description: "" } };
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

    // set the url to the 
    const url = `/api/posts/${id}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ post: response }))
      .catch(() => this.props.history.push("/posts"));
  }

}
export default Post;