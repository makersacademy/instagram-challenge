const User = require("../model/user");

const signUpController = {
  async Index(req, res) {
    res.render("signup/index", { errors: req.flash("errors") });
  },
  // eslint-disable-next-line consistent-return
  async NewUser(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const { email } = req.body;
      const user = new User();
      let newUser;
      try {
        newUser = await user.addUser(username, password, email);
      } catch (err) {
        req.flash("errors", err.message);
        return res.redirect("/signup");
      }
      const userId = newUser.id;
      req.session.authenticated = true;
      // Add the user object below:
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

module.exports = signUpController;
