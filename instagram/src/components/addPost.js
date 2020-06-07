import React, { Component } from 'react';
import SeePost from './seePost';
import '../index.css'
const $ = window.$;

class AddPost extends Component {

  constructor(){
    super();
    // super like polymorphism - App as the master class, which this class refers to.

    this.state = {
      caption: '',
      image: ''
    };

  this.onChange = this.onChange.bind(this);
  this.onSubmit = this.onSubmit.bind(this);
 }

   onChange(e) {
       let target = e.target;
       let value = target.value;
       let name = target.name;

       this.setState({
         [name]: value
       });
   }

  onSubmit(e) {
    e.preventDefault();
    window.location = '/posts';
  }


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
}

  render(){
       return(
      <div className="AddPost">
      <center>
       <h2>Add your post below...</h2>
        <form onSubmit={this.onSubmit} className="addPost" action="/addpost">
          <div className="AddImage">
          <input type="file" id="files" name="image" onChange={this.handleFileSelect}/>
           <output id="list"></output>
           </div>
           <div className="AddCaptionForPost">
             <label className="AddCaption" htmlFor="caption">Add Caption</label><br></br><br></br>
             <input type="text" id="newpostcaption" className="FormField_Input" placeholder="Add a caption here" name="caption" value={this.state.caption} onChange={this.onChange}/>
           </div>
           <div className="SubmitNewPost">
              <button className="SubmitPost">Add Post!</button>
           </div>
           {// <div>
           // <SeePost image={this.state.image}/>
           // <App image={this.state.image}/>
           // <SeePost caption={this.state.caption}/>
           // </div>
         }
         </form>
         </center>
      </div>
    )
  };
};

export default AddPost
