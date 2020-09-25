import React from 'react';

const PostTableRow = (props)=>{
  const {firstName,lastName,image,likes,_id} = props.post;
  return(
      <tr>
          <th scope="row">{_id}</th>
          <td>{firstName}</td>
          <td>{lastName}</td>
          <td>{image}</td>
          <td>{likes}</td>
          <td>
              <div className="btn-group" role="group" aria-label="Basic example">
                  <button type="button" onClick={props.showEditForm.bind(this,props.post)} className="btn btn-secondary">Edit</button>
                  <button type="button" onClick={props.deleteHandler.bind(this,_id)} className="btn btn-danger">Delete</button>
              </div>
          </td>
          
      </tr>
  )
}

export default PostTableRow;