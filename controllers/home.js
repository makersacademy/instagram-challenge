const User = require('../model/user');

const HomeController = {
  Index: async function (req, res) {
    res.render('home/index')
  },
  Login: async function (req, res) {
    // let sessionKey = User.provideSessionKey()
    // sessionStorage.setItem('key', 'value');
    res.redirect('/posts');
  }
};

module.exports = HomeController;