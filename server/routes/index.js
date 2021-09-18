var express = require("express");
var router = express.Router();
const usersController = require("../controllers").users;

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

/* POST create user */
router.post("/users", usersController.create);

module.exports = router;
