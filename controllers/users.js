const User = require("../models/user");

const UsersController = {
  New: (req, res) => {
    res.render("users/new", {user: req.session.user});
  },

  Create: (req, res) => {
    const user = new User(req.body);
    user.email = req.body.email;
    user.password = req.body.password;
    user.username = req.body.username;
    
    user.save((err) => {
      if (err) {
        throw err;
      }
      res.status(201).redirect("/posts");
    });
  },
};

module.exports = UsersController;
