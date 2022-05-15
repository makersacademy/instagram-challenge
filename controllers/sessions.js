const User = require("../models/user");

const SessionsController = {
  Create: (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    User.findOne({ email: email }).then((user) => {
      if (!user) {
        res.redirect("/");
      } else if (user.password != password) {
        res.redirect("/");
      } else {
        req.session.user = user;
        res.redirect("/posts");
      }
    });
  },
};

module.exports = SessionsController;