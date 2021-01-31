import React, { useState } from "react";
import Button from "react-bootstrap/Button";

class FollowButton extends React.Component {
  constructor() {
    super();
    this.state = {
      following: false,
      followers: 0
    };
    this.handleFollow = this.handleFollow.bind(this);
    this.handleUnfollow = this.handleUnfollow.bind(this);
  }

  handleFollow() {
    this.setState(
      {
        following: true,
        followers: this.state.followers + 1
      },
    );
  }

  handleUnfollow() {
    this.setState(
      {
        following: false,
        followers: this.state.followers - 1
      }
    )
  }

  render() {
    const following = this.state.following;
    const label = this.state.following ? "Unfollow" : "Follow";
    let button;
    if (following) {
      button = <Button variant="info" onClick={this.handleUnfollow}>{label}</Button>
    } else {
      button = <Button variant="info" onClick={this.handleFollow}>{label}</Button>
    }

    return (
      <div className="customContainer">
       {button}
        <span> {this.state.followers} followers</span>
      </div>
    );
  }
}

export default FollowButton;
