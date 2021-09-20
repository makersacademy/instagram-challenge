const User = require('../model/user');

const signUpController = {
  async Index(req, res) {
    res.render('signup/index');
  },
  async NewUser(req, res) {
    try {
      const { newUserUsername } = req.body;
      const { newUserPassword } = req.body;
      const { newUserEmail } = req.body;
      User.addUser(newUserUsername, newUserPassword, newUserEmail);
      res.redirect('/posts');
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = signUpController;
