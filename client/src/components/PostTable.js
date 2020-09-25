import React from 'react';
import PostTableRow from './PostTableRow';

const PostTable = (props)=>{
  return(
      <table className="table">
          <thead>
              <tr>
                  <th scope="col">#</th>
                  <th scope="col">First Name</th>
                  <th scope="col">Last Name</th>
                  <th scope="col">Job Title</th>
                  <th scope="col">Salary</th>
              </tr>
          </thead>
          <tbody>
             {props.posts.map(post=>{
                 return <PostTableRow key={post._id}
                                          post={post}
                                          deleteHandler={props.deleteHandler}
                                          showEditForm={props.showEditForm}/>
             })}
          </tbody>
      </table>
  )
}

export default PostTable;