import React, { Component } from 'react';
import axios from 'axios';
import '../index.css'

class AddPost extends Component {

  constructor(){
    super();
    // super like polymorphism - App as the master class, which this class refers to.

    this.state = {
      caption: '',
      image: '',
      posts: []
      // make a state for the incoming data when API is called.
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }


  showInstaPost = () => {
    this.getInstaPost();
  };



   getInstaPost = () => {
     axios.get('http://localhost:8080/api/')
     .then((response) => {
       const data = response.data;
       this.setState({ posts: data });
       console.log('Data has been received!');
     })
      .catch(() => {
        alert('Error retrieving data!');
    });
   }

   onChange(e){
       let target = e.target;
       let value = target.value;
       let name = target.name;

       this.setState({
         [name]: value
       });
   }

  onSubmit(e) {
    e.preventDefault();
// prevents the browser from refreshing

  const serverData = {
    caption: this.state.caption,
    image: this.state.image
  };

    axios({
      url: 'http://localhost:8080/api/save',
      method: 'POST',
      data: serverData
    })
      .then(() => {
        console.log('Data has been sent to the server');
        this.resetUserInputs();
      })
      .catch(() => {
        console.log('Data has NOT been sent to server');
      });;
  };
  // this is the syntax for axios ^ a bit different.

  resetUserInputs = () => {
    this.setState({
      caption: '',
      image: ''
    });
  };

  displayInstaPost = (posts) => {
    if (!posts.length) return null;

    return posts.map((post, index) => (
      <div key={index} className="insta_post_display">
      <p>{post.caption}</p>
      <p>{post.image}</p>
      </div>
    ));
    // need two brackets here - curly braces assume it's an expression but it's actually a function.
  };


  handleFileSelect(e) {
        var files = e.target.files;
        var f = files[0];
        var reader = new FileReader();

          reader.onload = (function(theFile) {
                return function(e) {
                  document.getElementById('list').innerHTML = ['<img src="', e.target.result,'" title="', theFile.name, '" width="50" />'].join('');
                };
          })(f);

          reader.readAsDataURL(f);
          this.onChange();
    }

  render(){
  console.log("state ", this.state)
  return(
  <div className="Posts">

    <div className="AddPost">
      <center>
       <h2>Add your post below...</h2>
        <form onSubmit={this.onSubmit} className="addPost">
          <div className="AddImage">
            <input type="file"
                   id="files"
                   name="image"
                   onChange={this.handleFileSelect}/>
             <output id="list"></output>
           </div>

           <div className="AddCaptionForPost">
               <label className="AddCaption" htmlFor="caption">Add Caption</label><br></br><br></br>
               <input type="text"
                      id="newpostcaption"
                      className="FormField_Input"
                      placeholder="Add a caption here"
                      name="caption"
                      value={this.state.caption}
                      onChange={this.onChange}/>
           </div>

           <div className="SubmitNewPost">
              <button className="SubmitPost">Add Post!</button>
           </div>

            <div className="Posts">
              {this.displayInstaPost(this.state.posts)}
            </div>
        </form>
      </center>
   </div>
   </div>
    )
  };
};

export default AddPost
