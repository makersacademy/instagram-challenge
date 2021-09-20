const express = require('express');
const User = require('../model/user');

const HomeController = {
  async Index(req, res) {
    res.render('home/index');
  },
  async Login(req, res) {
    const loginUsername = req.body.loginUserUsername;
    const loginPassword = req.body.loginUserPassword;
    const isUserAuthenticated = await User.authenticate(
      loginUsername,
      loginPassword,
    );
    if (isUserAuthenticated === false) {
      res.redirect('/');
    }
    res.redirect('/posts');
  },
};

module.exports = HomeController;
