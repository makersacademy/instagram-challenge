import React, { Component } from 'react';
import './Message.css'

class Message extends Component {
  constructor() {
    super()

    this.state = {
      message: '',
      formSubmitted: false,
      isHidden:true
    }
    this.handleChangeMessage = this.handleChangeMessage.bind(this);
    this.formHandler = this.formHandler.bind(this);
  }

  handleChangeMessage = (event) => {
    this.setState({
        message : event.target.value
    })
    // console.log(this.state)
  }

  formHandler(event) {
    // alert(this.state.message)
    var url = 'http://localhost:5000/api/messages';
    var post = {message: this.state.message}
    console.log(post)
    event.preventDefault();

    this.setState({
      formSubmitted: true
    })

    fetch(url, {
      method: 'POST',
      body: JSON.stringify( post ),
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(res => res.json())
    .then(response => console.log('Success:', JSON.stringify(response)))
    .then(window.location.reload())
    .catch(error => console.error("Error:", error));

  }
  render() {
    var divStyle = {
      display:'block'
    }
    return (
      <div style={divStyle} className="Message" >
      <form id="messageForm" onSubmit={this.formHandler}>

        <div>
        <label for="message-field">Message</label><br/>
          <textarea onChange={this.handleChangeMessage} name="message" id="message-field" className="postfield"  rows="6"  cols="50">
          </textarea>
        </div>

        <div>
          <button type="submit" id="cb" className="postbutton">Add Post</button>
        </div>
      </form>
    </div>
    );
  }
}

export default Message;
