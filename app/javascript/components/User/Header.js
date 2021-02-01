import React from "react";
import styled from "styled-components";


const Main = styled.div`
`
const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 50px;
  padding-bottom: 30px;
  border-bottom: 2px solid #efefef;

`;
const ProfilePhoto = styled.div`
  width: 200px;
  height: 200px;
  overflow: hidden;
  border-radius: 50%;
  margin-right: 50px;
  img {
    width: auto;
    margin-left: -50px;
    height: 100%;
  }
`;

const Header = props => {
  const { username, profile_photo } = props.attributes;
  const total = props.posts.length;

  return (
    <Main>
      <Container>
        <ProfilePhoto>
          <img src={profile_photo} />
        </ProfilePhoto>
        <h1>{username}</h1>
      </Container>
      <div className="followers"></div>
      <div className="totalPosts">{total} posts</div>
    </Main>
  );
};

export default Header;
