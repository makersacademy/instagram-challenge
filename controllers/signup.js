const User = require('../model/user');

const signUpController = {
  async Index(req, res) {
    res.render('signup/index');
  },
  async NewUser(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const { email } = req.body;
      const user = new User();
      const newUser = await user.addUser(username, password, email);
      const userId = newUser.id;
      // Add your authenticated property below:
      req.session.authenticated = true;
      // Add the user object below:
      req.session.user = {
        username,
        userId,
      };
      res.redirect('/posts');
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = signUpController;
