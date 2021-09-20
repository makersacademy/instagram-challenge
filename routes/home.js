const express = require("express");

const homeRouter = express.Router();

const HomeController = require("../controllers/home");

homeRouter.get("/", HomeController.Index);
homeRouter.post("/login", HomeController.Login);

module.exports = homeRouter;
