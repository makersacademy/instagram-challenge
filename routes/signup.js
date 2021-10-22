const express = require("express");

const signUpRouter = express.Router();

const signUpController = require("../controllers/signup");

signUpRouter.get("/", signUpController.Index);
signUpRouter.post("/", signUpController.NewUser);

module.exports = signUpRouter;
