import React from 'react';
import ReactDOM from 'react-dom'

class HeaderLink extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <li>
        <a href="#" onClick={this.props.handleClick}>
          <span className={"glyphicon glyphicon-" + this.props.icon}>
          </span>
          {this.props.label}
        </a>
      </li>
    )
  }
}

export default HeaderLink