import React from 'react';
import PostTable from './components/PostTable';
import Form from './components/Form';
import Message from './components/Message';
import PostAPI from './PostAPI';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        posts : [],
        isEditForm : false,
        post: {
            firstName : "",
            lastName : "",
            image : "",
            likes : "",
  
        },
        message : ""
    };

    this.deleteHandler = this.deleteHandler.bind(this);
    this.addHandler = this.addHandler.bind(this);
    this.updateHandler = this.updateHandler.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.showEditForm= this.showEditForm.bind(this);
  }

  componentDidMount(){
    PostAPI.getPosts().then(data=>{this.setState({posts : data.response})})
  }

  resetForm(){
    this.setState({
      post: {
        firstName: "",
        lastName: "",
        image: "",
        likes: ""
      }
    }) 
  }

  handleChange(e){
    this.setState({
      post: {
        ...this.state.post,
        [e.target.name] : e.target.value
      }
    })
  }

  showEditForm(post) {
    this.setState({isEditForm: true, post: post});
  }

  async deleteHandler(id){
    const deleteData = await PostAPI.deletePost(id);
    const message = deleteData.message;
    if(message.msgError){
      this.setState({message})
    }else{
      const data = await PostAPI.getPosts();
      this.setState({message,post : data.response})
    }
  }

  async updateHandler(e){
    e.preventDefault();
    const updateData = await PostAPI.updatePost(this.state.post);
    const message = updateData.message;
    if(message.msgError){
      this.setState({message})
    }else{
      const data = await PostAPI.getPosts();
      this.setState({message,post: data.response})
    }
    this.setState({isEditForm: false});
    this.resetForm();
  }

  async addHandler(e){
    e.preventDefault();
    const postData = await PostAPI.createPost(this.state.post);
    const message = postData.message;
    if(message.msgError){
      this.setState({message})
    }else{
      const data = await PostAPI.getPosts();
      this.setState({message,post : data.response})
    }
    this.resetForm();
  }
  renderPostTable(){
    if(this.state.post.length > 0) {
      return (
        <PostTable posts={this.state.posts}
                      deleteHandler={this.deleteHandler}
                      showEditForm={this.showEditForm} />
      )
    }
    return null;
  }

  renderForm() {
    return(
      <Form isEditForm={this.state.isEditForm}
            post={this.state.post}
            handleChange={this.handleChange}
            handler={!this.state.isEditForm ? this.addHandler : this.updateHandler } />
    )
  }

  renderMessage(){
    if(this.state.message === "")
      return null;
    return(
      <Message message={this.state.message} />
    )
  }

  render() {
    return (
      <div className="row">
        <div ClassName="col"></div>
        <div ClassName="col-10">
          {this.renderPostTable()}
          {this.renderForm()}
          {this.renderMessage()}
        </div>
        <div ClassName="col"></div>
      </div>
    )
  } 

}

export default App;