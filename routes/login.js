const express = require('express');

const loginRouter = express.Router();

const LoginController = require('../controllers/login');

homeRouter.get('/login', HomeController.Index);
homeRouter.post('/login', HomeController.Login);

module.exports = loginRouter;
