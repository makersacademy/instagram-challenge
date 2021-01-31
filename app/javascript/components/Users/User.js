import React from 'react'
import { BrowserRouter as Router, Link} from 'react-router-dom'
import styled from 'styled-components'
import FollowButton from '../follow_button'

const Card = styled.div`
  border: 1px solid #efefef;
  background: #fff;
  text-align: center;

`
const ProfilePhoto = styled.div`
  img {
    height: 300px;
    border: 1px solid #efefef;
  }
`
const Username = styled.div`
  font-weight: bold;
  padding: 20px 0 10px 0;

`
const LinkWrapper = styled.div`
  margin-top: 30px;
  height:50px;
  a {
    color: #fff;
    background-color: #71b406;
    border-radius: 4px;
    padding: 10px 50px;
    cursor: pointer;
    border-radius: 3px;
    border: 1px solid #71b406;
    text-align: center;
    line-height: 20px;
    min-height: 40px;
    margin: 7px;
    font-weight: 600;
    text-decoration: none;
    width: 100%;
    transition: ease-in-out 0.1s;
    &:hover{
      border-color: #619a07;
      background: #619a07;
    }
  }
`

const User = (props) => {
  return (
    <Card>
      <Username>
        {props.attributes.username}
      </Username>
      <ProfilePhoto>
        <img src={props.attributes.profile_photo}></img>
      </ProfilePhoto>
      <LinkWrapper>
        <Link to={"/users/" + props.attributes.slug}>View Profile</Link>
      </LinkWrapper>
      <FollowButton />
    </Card>
  )
}

export default User