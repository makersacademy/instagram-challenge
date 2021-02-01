import React from "react";
import LikeButton from "../like_button";
import styled from "styled-components";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import axios from "axios";

const ProfilePhoto = styled.div`
  overflow: hidden;
  img {
    height: 300px;
    border: 1px solid #efefef;
  }
`;

const Card = styled.div`
  border: 1px solid #efefef;
  background: #fff;
  text-align: center;
  width: 300px;
  overflow: hidden;

`

const Post = (props) => {
  const { id, image_url, comments } = props.attributes;
  // const [post_comments, setComments] = useState([]);
  // const [loaded, setLoaded] = useState(false);

  // handleComment = event => {
  //   event.preventDefault();
  //   const comment = { "comment": `${this.state.comment}` };
  //   axios.patch('/api/v1/posts', comment)
  //   .then(response => {
  //     this.setState(response.data.id)
  //     this.props.history.push('/')
  //   })
  //   .catch(error => {
  //     this.setState({ errorMessage: error.message });
  //     console.error('There was an error!', error);
  // });
  // };

  // let postComments;

  // if (posts && posts.length > 0) {    
  //   userPosts = posts.map( (post, index) => {
  //     return (
  //       <Post 
  //         key={index}
  //         id={post.id}
  //         attributes={post.attributes}
  //       />
  //     )
  //   })
  // }

  return (
    <Card>
      <ProfilePhoto>
        <img src={image_url}/>
      </ProfilePhoto>
      <LikeButton />
      <Form.Group>
        <Form.Control type="text" placeholder="Leave a comment" inline="true"/>
          <Button variant="info" type="submit" size="sm">
            Enter
          </Button>
      </Form.Group>
    </Card>
  );
};

export default Post;
