import React from 'react';

function SeePost(props){
  return(
    <div className="seePosts">
    <h3>See Posts below...</h3>
     <p>{props.image}</p>
     <p>{props.caption}</p>
     </div>
  )
}

export default SeePost
