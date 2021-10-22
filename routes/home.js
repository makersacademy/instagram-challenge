const express = require("express");

const homeRouter = express.Router();

const homeController = require("../controllers/home");

homeRouter.get("/", homeController.Index);

module.exports = homeRouter;
