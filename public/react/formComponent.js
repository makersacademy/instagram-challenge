'use strict';

class FormComponent extends React.Component {
  constructor() {
    super();
    this.state = {};
  };

  submitHandler = (event) => {
    event.preventDefault();
    console.log("hello world");
  }

  changeHandler = (event) => {
    this.setState({content: event.target.value});
  }

  render() {
    return (
      <form id='new-post-form' onSubmit={this.submitHandler}>
        <input type='text' id='new-post' name='photo' onChange={this.changeHandler}></input>
        <input type='submit' value='submit'></input>
      </form>
    );
  }
}

ReactDOM.render(<FormComponent />, document.getElementById('app'));
