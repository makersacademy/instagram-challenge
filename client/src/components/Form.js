import React from 'react';
import Input from './Input';

const Form = (props)=>{
    return(
        <form onSubmit={props.handler}>
            <h4>{props.isEditForm ? "Editing Post: " : "Add Post: "}</h4>
            <div className="form-group">
                <Input name="firstName"
                       placeholder="Enter First Name"
                       labelName="First Name: "
                       handleChange={props.handleChange}
                       value={props.post.firstName}/>
                <Input name="lastName"
                       placeholder="Enter Last Name"
                       labelName="Last Name: "
                       handleChange={props.handleChange}
                       value={props.post.lastName}/>
                <Input name="image"
                        placeholder="Enter Image"
                        labelName="Image url: "
                        handleChange={props.handleChange}
                        value={props.post.image}/>
                <Input name="likes"
                        placeholder="Enter Likes"
                        labelName="Likes: "
                        handleChange={props.handleChange}
                        value={props.post.likes}/>
            </div>
            <button type="submit" className="btn btn-primary">Submit</button>
        </form> 
    )
}

export default Form;