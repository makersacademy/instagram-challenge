const User = require("../model/user");

const signUpController = {
  async Index(req, res) {
    res.render("signup/index", { message: req.flash("message") });
  },
  // eslint-disable-next-line consistent-return
  async NewUser(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const { email } = req.body;
      const user = new User();
      if (User.isThereAnyBlankInputs(username, email) === true) {
        req.flash("message", "Please fill in all boxes");
        return res.redirect("/signup");
      }
      if ((await user.isUsernameTaken(username)) === true) {
        req.flash("message", "username already in use");
        return res.redirect("/signup");
      }
      if ((await user.isEmailTaken(email)) === true) {
        req.flash("message", "email already in use");
        return res.redirect("/signup");
      }
      if (User.isPasswordTooShort(password) === true) {
        req.flash("message", "password needs to be at least 8 characters");
        return res.redirect("/signup");
      }
      const newUser = await user.addUser(username, password, email);
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
