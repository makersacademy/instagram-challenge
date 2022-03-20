import React from 'react';
import { Route, Routes } from "react-router-dom";
import CreateUser from "./components/users/create";
import CreatePost from "./components/posts/create";
import ShowPosts from "./components/posts/index";
import Home from "./components/home/index";
import "bootstrap/dist/css/bootstrap.css";

const App = () => {
  return (  
    <div>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/users/new" element={<CreateUser />} />
        <Route path="/posts/new" element={<CreatePost />} />
        <Route path="/posts/" element={<ShowPosts />} />
      </Routes>
    </div>
  );
 };


export default App;
