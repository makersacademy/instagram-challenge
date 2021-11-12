const flash = require("connect-flash");
const User = require("../model/user");

const LoginController = {
  async Index(req, res) {
    res.render("login/index", { message: req.flash("message") });
  },
  // eslint-disable-next-line consistent-return
  async Login(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const user = new User();
      const isUserAuthenticated = await user.authenticate(username, password);
      const userId = isUserAuthenticated.id;
      if (isUserAuthenticated === "incorrect username") {
        req.flash("message", "Incorrect username");
        return res.redirect("/login");
      }
      if (isUserAuthenticated === "incorrect password") {
        req.flash("message", "Incorrect password");
        return res.redirect("/login");
      }
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
