const User = require("../models/user");

const SessionsController = {

  New: (req, res) => {
    res.render("/sessions/new", {});
  },

  Create: (req, res) => {
    const name = req.body.name;

    User.findOne({ name: name }).then((user) => {
      if (!user) {
        res.redirect("/");
      } else {
        req.session.user = user;
        res.redirect("/images");
      }
    });
  },

  Destroy: (req, res) => {
    if (req.session.user && req.cookies.user_sid) {
      res.clearCookie("user_sid");
    }
    res.redirect("/");
  },
};

module.exports = SessionsController;
