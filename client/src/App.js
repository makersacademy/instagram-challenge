import React from 'react';
import { Route, Routes } from "react-router-dom";
import CreateUser from "./components/users/create";
import CreatePost from "./components/posts/create";
import Home from "./components/home/index";
import "bootstrap/dist/css/bootstrap.css";

const App = () => {
  return (  
    <div>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/users/new" element={<CreateUser />} />
        <Route path="/posts/new" element={<CreatePost />} />
      </Routes>
    </div>
  );
 };


export default App;
