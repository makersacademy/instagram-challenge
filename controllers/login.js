const User = require('../model/user');

const LoginController = {
  async Index(req, res) {
    res.render('login/index');
  },
  async Login(req, res) {
    try {
      const { username } = req.body;
      const { password } = req.body;
      const user = new User();
      const isUserAuthenticated = await user.authenticate(username, password);
      const userId = isUserAuthenticated.id;
      if (isUserAuthenticated === false) {
        return res.redirect('/');
      }
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

module.exports = LoginController;
