import React from 'react';
import { Route, Routes } from "react-router-dom";
import Create from "./components/users/create";
import Home from "./components/home/index";
import "bootstrap/dist/css/bootstrap.css";

const App = () => {
  return (  
    <div>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/test" element={<Create />} />
      </Routes>
    </div>
  );
 };


export default App;
