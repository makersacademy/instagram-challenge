import React, { useState, useEffect, Fragment } from "react";
import axios from "axios";
import User from "./User";
import styled from "styled-components";
import { Route, Switch, Link } from "react-router-dom";
import LikeButton from "../like_button";
import Menu from "../Menu"


const Home = styled.div`
  text-align: center;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
`;
const Header = styled.div`
  padding: 100px 100px 10px 100px;

  h1 {
    font-size: 42px;
  }
`;
const Subheader = styled.div`
  font-weight: 300;
  font-size: 26px;
`;
const Grid = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  width: 100%;
  padding: 20px;
`;

const Users = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    axios
      .get("/api/v1/users.json")
      .then(resp => {
        setUsers(resp.data.data);
      })
      .catch(resp => console.log(resp));
  }, [users.length]);

  const grid = users.map(item => {
    return (
      <div>
        <User key={item.attributes.id} attributes={item.attributes} />
        
      </div>
    );
  });

  return (
    <Home>
      <Menu />
      <Header>
        <h1>InstaMiligram</h1>
        <Subheader>Lighter and Better</Subheader>
      </Header>

      <Grid>{grid}</Grid>
    </Home>
  );
};

export default Users;
