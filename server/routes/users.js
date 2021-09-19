var express = require("express");
var router = express.Router();
const usersController = require("../controllers").users;

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "users route" });
});

/* POST create user */
router.post("/", async (req, res) => {
  let response = await usersController.create(req, res);
  if (response === true) {
    res.redirect("/users");
  }
});

/*GET create user form */
router.get("/new", function (req, res, next) {
  res.render("users/new", { title: "Create a new account" });
});

module.exports = router;
