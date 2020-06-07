'use strict';

class FormComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      selectedFile: null,
      success: ""
    };
  };

  clickHandler = () => {
    const data = new FormData()
    data.append('file', this.state.selectedFile);
    axios.post('http://localhost:3000/posts', data, {

    })
    .then(res => {
      console.log(res.statusText);
      this.setState({
        success: "Upload successful"
      })
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
      <div>
          <input type='file' name='file'  onChange={this.changeHandler}></input>
          <button id='submitButton' type='button' value='submit' onClick={this.clickHandler}>Upload</button>

        <p>{this.state.success}</p>
      </div>
    );
  }
}
