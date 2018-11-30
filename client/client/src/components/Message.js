import React, { Component } from 'react';
import './Message.css'

class Message extends Component {
  render() {
    return (
      <div className="Message">
      <div>
        <label for="message-field">Message</label><br/>
          <textarea onChange={this.handleChangeMessage} name="message" id="message-field" className="postfield"  rows="6"  cols="50">
          </textarea>
        </div>
      </div>
    );
  }
}

export default Message;
