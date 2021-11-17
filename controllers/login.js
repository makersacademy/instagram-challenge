const User = require("../model/user");

const LoginController = {
  async Index(req, res) {
    res.render("login/index", {
      errors: req.flash("errors"),
    });
  },
  // eslint-disable-next-line consistent-return
  async Login(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const user = new User();
      let isUserAuthenticated;
      try {
        isUserAuthenticated = await user.authenticate(username, password);
      } catch (err) {
        req.flash("errors", err.message);
        return res.redirect("/login");
      }
      const userId = isUserAuthenticated.id;
      req.session.authenticated = true;
      req.session.user = {
        username,
        userId,
      };
      // return to user's previous page
      res.redirect(req.session.returnTo || "/posts");
      delete req.session.returnTo;
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = LoginController;
