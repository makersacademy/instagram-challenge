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
    data.append('image', this.state.selectedFile);
    data.append('userName', this.state.name);
    data.append('caption', this.state.caption);
    axios.post('http://localhost:3000/posts', data, {
    })
    .then(res => {
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
      <form>
        <input type="text" name="userName" onChange={this.textChangeHandler} placeholder="Your name..."></input>
        <label className="button">
          <input type='file' name='image' onChange={this.changeHandler}></input>
          Select a file
        </label>
        <input type="text" name="caption" onChange={this.captionChangeHandler} placeholder="Your message..."></input>
        <button className="button" id='submitButton' type='button' value='submit' onClick={this.clickHandler}>Upload</button>
        <p>{this.state.success}</p>
      </form>
    );
  }
}
