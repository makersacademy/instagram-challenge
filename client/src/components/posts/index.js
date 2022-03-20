import React, { useEffect, useState } from "react";

const Post = (props) => (
  <div>{props.post.message}</div>
 );

export default function ShowPosts() {
  const [posts, setPosts] = useState([]);

 // This method fetches the posts from the database.
  useEffect(() => {
    async function getPosts() {
      const response = await fetch(`http://localhost:4000/posts/`);

      if (!response.ok) {
        const message = `An error occurred: ${response.statusText}`;
        window.alert(message);
        return;
      }

      const posts = await response.json();
      {console.log("Posts are", posts)}
      setPosts(posts);
    }
    

    getPosts();

    return;
  }, [posts.length]);


  // This method will map out the posts
  function postList() {
    return posts.map((post) => {
      return (
        <Post
          post={post}
          key={post._id}
        />
      );
    });
}

  // This following  will display the posts 
  return (
    <div>
      <h3>Posts</h3>
        {postList()}
    </div>
  );
}




