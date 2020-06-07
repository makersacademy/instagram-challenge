import React, { Component } from 'react';
import axios from 'axios';
import '../index.css'

class AddPost extends React.Component {

  // constructor(){
  //   super();
    // super like polymorphism - App as the master class, which this class refers to.

    state = {
      caption: '',
      image: '',
      posts: []
      // make a state for the incoming data when API is called.
    };

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

    handleFileSelect = (e) => {
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


    handleChange = ({ target }) => {
      const { name, value } = target;
      this.setState({ [name]: value });
    };


   submit = (event) => {
    event.preventDefault();
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
        this.getInstaPost();
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
      <img src="{{post.image}}" alt="hey"/>
      </div>
    ));
    // need two brackets here - curly braces assume it's an expression but it's actually a function.
  };


  render(){
    console.log("state ", this.state);

  return(
  <div className="Posts">
    <center>
      <h2> Welcome to <em>Picture This</em>!</h2>
      <form onSubmit={this.submit} className="addPost">
        <div className="AddImage">
            <input type="file"
                   id="files"
                   name="image"
                   onChange={this.handleFileSelect, this.handleChange}/>
             <output id="list"></output>
        </div>

        <div className="AddCaption">
           <input type="text"
                  id="newpostcaption"
                  placeholder="Add a caption here"
                  name="caption"
                  value={this.state.caption}
                  onChange={this.handleChange}/>
       </div>
              <button>Add Post or Click Here to See Current Posts!</button>
      </form>

      <div className="Posts">
        {this.displayInstaPost(this.state.posts)}
      </div>
    </center>
   </div>
  );
  }
}

export default AddPost
