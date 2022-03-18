const User = require("../models/user");
const bcrypt = require("bcrypt")
const saltRounds = 10;

const UsersController = {

  New: (req, res) => {
    res.render("users/new", {title: "Instagram - Sign up"});
  },

  Create: (req, res) => {

    const hash = bcrypt.hashSync(req.body.password, saltRounds);
    req.body.password = hash
    const user = new User(req.body);

    user.save((err) => {
      if (err) {
        throw err;
      }
      req.session.user = user;
      res.status(201).redirect("/posts");
    });
  },

};

module.exports = UsersController;
