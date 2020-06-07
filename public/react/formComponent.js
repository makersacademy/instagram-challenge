'use strict';

class FormComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      selectedFile: null
    };
  };

  clickHandler = () => {
    const data = new FormData()
    data.append('file', this.state.selectedFile);
    axios.post('http://localhost:3000/upload', data, {

    })
    .then(res => {
      console.log(res.statusText);
    })
  }

  changeHandler = (event) => {
    this.setState({
      selectedFile: event.target.files[0],
      loaded: 0
    });
  }

  render() {
    return (
      <form id='new-post-form' onSubmit={this.submitHandler}>
        <input type='file' name='file'  onChange={this.changeHandler}></input>
        <button type='button' value='submit' onClick={this.clickHandler}>Upload</button>
      </form>
    );
  }
}

ReactDOM.render(<FormComponent />, document.getElementById('app'));
