import React from 'react';
import ReactDOM from 'react-dom'

class Button extends React.Component {
  render() {
    return (
      <div className='form-group'>
        <button
          name={this.props.name}
          id={this.props.name + '-btn'}
          className={"btn btn-" + this.props.class}
          onClick={this.props.handleClick}>{this.props.label}</button>
      </div>
    )
  }
}

export default Button