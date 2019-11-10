import React from 'react';
import ReactDOM from 'react-dom'

class Input extends React.Component {
  render() {
    return (
      <div className="form-group">
        <input
          required="required"
          placeholder={this.props.label}
          type={this.props.type}
          name={this.props.name}
          id={this.props.name + '-input'}
          className={"form-control " + this.props.class}></input>
      </div>
    )
  }
}

export default Input