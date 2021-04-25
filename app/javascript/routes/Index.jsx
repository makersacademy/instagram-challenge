import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import NewUser from "../components/NewUser";
import Posts from "../components/Posts";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/sign-up" exact component={NewUser}/>
      <Route path="/posts" exact component={Posts}/>
    </Switch>
  </Router>
);


// To add more routes declare another route, matching it's path to a component to render that page