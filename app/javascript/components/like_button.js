import React, { useState } from "react";
import Button from "react-bootstrap/Button";

class LikeButton extends React.Component {
  constructor() {
    super();
    this.state = {
      liked: false,
      likes: 0
    };
    this.handleLike= this.handleLike.bind(this);
    this.handleUnlike= this.handleUnlike.bind(this);
  }

  handleLike() {
    this.setState(
      {
        liked: true,
        likes: this.state.likes + 1
      }
    );
  }

  handleUnlike() {
    this.setState(
      {
        liked: false,
        likes: this.state.likes - 1
      }
    );
  }

  render() {
    const liked = this.state.liked;
    const label = this.state.liked ? "Unlike" : "Like";
    let button;
    if (liked) {
      button = <Button variant="info" onClick={this.handleUnlike} size="sm">{label}</Button>
    } else {
      button = <Button variant="info" onClick={this.handleLike} size="sm">{label}</Button>
    }

    return (
      <div className="customContainer">
       {button}
        <span> {this.state.likes} Likes</span>
      </div>
    );
  }
}

export default LikeButton;
