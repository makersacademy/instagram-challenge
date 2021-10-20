const express = require('express');

const homeRouter = express.Router();

const HomeController = require('../controllers/home');

homeRouter.get('/logout', HomeController.Logout);
homeRouter.get('/', HomeController.Index);

module.exports = homeRouter;
