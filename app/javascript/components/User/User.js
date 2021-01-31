import React, { useState, useEffect } from "react";
import axios from "axios";
import Header from "./Header"
import styled from 'styled-components'
import Post from './Post'

const Wrapper = styled.div`
  margin-left: auto;
  margin-right:auto;
`
const Home = styled.div`
  text-align: center;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
`;

const Grid = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  width: 100%;
  padding: 20px;
`;

const User = props => {
  const [user, setUser] = useState({});
  const [posts, setPosts] = useState([]);
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    const slug = props.match.params.slug;
    const url = `/api/v1/users/${slug}`;

    axios
      .get(url)
      .then(resp => {
        setUser(resp.data);
        setPosts(resp.data.included)
        setLoaded(true);
      })
      .catch(resp => console.log(resp));
  }, []);

  let userPosts;

  if (posts && posts.length > 0) {    
    userPosts = posts.map( (post, index) => {
      return (
        <Post 
          key={index}
          id={post.id}
          attributes={post.attributes}
        />
      )
    })
  }

  return (
    <Home>
    <Wrapper>
    { loaded && 
      <Header 
        attributes={user.data.attributes} 
        posts={user.included}
      />
    }
      <Grid>{userPosts}</Grid>
    </Wrapper>
    </Home>
  );
};

export default User;
