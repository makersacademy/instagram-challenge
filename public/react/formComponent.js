'use strict';

class FormComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      selectedFile: null,
      name: "",
      caption: "",
      success: ""
    };
  };

  clickHandler = () => {
    const data = new FormData()
    console.log(data)
    data.append('image', this.state.selectedFile);
    data.append('userName', this.state.name);
    data.append('caption', this.state.caption);
    axios.post('http://localhost:3000/posts', data, {

    })
    .then(res => {
      console.log(res.statusText);
      this.props.updatemethod();
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

  textChangeHandler = (event) => {
    this.setState({
      name: event.target.value
    })
  }

  captionChangeHandler = (event) => {
    this.setState({
      caption: event.target.value
    })
  }

  render() {
    return (
      <div>
        <label>Your name:</label>
        <input type="text" name="userName" onChange={this.textChangeHandler}></input>
        <input type='file' name='image' onChange={this.changeHandler}></input>
        <label>Caption:</label>
        <input type="text" name="caption" onChange={this.captionChangeHandler}></input>
        <button id='submitButton' type='button' value='submit' onClick={this.clickHandler}>Upload</button>
        <p>{this.state.success}</p>
      </div>
    );
  }
}
