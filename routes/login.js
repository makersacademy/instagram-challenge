const express = require('express');

const loginRouter = express.Router();

const loginController = require('../controllers/login');

loginRouter.get('/', loginController.Index);
loginRouter.post('/', loginController.Login);

module.exports = loginRouter;
