const User = require("../model/user");

const LoginController = {
  async Index(req, res) {
    res.render("login/index");
  },
  async Login(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const user = new User();
      const isUserAuthenticated = await user.authenticate(username, password);
      const userId = isUserAuthenticated.id;
      if (isUserAuthenticated === false) {
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
