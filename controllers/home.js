const User = require('../model/user');
const express = require("express");
const app = express();

const HomeController = {
  Index: async function (req, res) {
    res.render('home/index')
  },
  Login: async function (req, res) {
    const loginUsername = req.body.loginUserUsername
    const loginPassword = req.body.loginUserPassword
    const isUserAuthenticated = await User.authenticate(loginUsername, loginPassword)
    if (isUserAuthenticated === false ) {res.redirect('/');}
    res.redirect('/posts');
  }
};

module.exports = HomeController;