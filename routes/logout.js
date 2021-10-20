const express = require('express');

const logoutRouter = express.Router();

const logoutController = require('../controllers/logout');

logoutRouter.get('/', logoutController.Logout);

module.exports = logoutRouter;
