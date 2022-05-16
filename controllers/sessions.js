const User = require("../models/user");

const SessionsController = {
  New: (req, res) => {
    res.render("sessions/new", {});
  },

  Create: (req, res) => {
    console.log("trying to log in");
    const email = req.body.email;
    const password = req.body.password;

    User.findOne({ email: email }).then((user) => {
      if (!user) {
        res.redirect("/sessions/new");
      } else if (user.password != password) {
        res.redirect("/sessions/new");
      } else {
        req.session.user = user;
        res.redirect("/posts");
      }
    });
  },

  Destroy: (req, res) => {
    console.log("logging out");
    if (req.session.user && req.cookies.user_sid) {
      res.clearCookie("user_sid");
    }
    res.redirect("/sessions/new");
  },
};

module.exports = SessionsController;
