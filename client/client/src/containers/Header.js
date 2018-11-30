import React, { Component } from 'react';
import Message from '../components/Message'

class Header extends Component {
  render() {
    return (
      <div className="Header">
      Instagram
        <div>
          <Message />
        </div>
      </div>
    );
  }
}

export default Header;
