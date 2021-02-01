import React from 'react'
import { Route, Switch, Link } from "react-router-dom";
import Button from "react-bootstrap/Button";
import styled from 'styled-components'

const MenuWrapper = styled.div`
  margin: 15px;
  float: right;
`

const Menu = () => {
  return (
    <MenuWrapper>
      <Link to={`/users/new`}>
        <Button variant="outline-primary">Register</Button>
      </Link>
    </MenuWrapper>
  )
}

export default Menu