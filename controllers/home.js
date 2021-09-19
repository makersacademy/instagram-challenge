const User = require('../model/user');

const HomeController = {
  Index: async function (req, res) {
    res.render('home/index')
  },
  Login: async function (req, res) {
    const loginUsername = req.body.loginUserUsername
    const loginPassword = req.body.loginUserPassword
    const isUserAuthenticated = await User.authenticate(loginUsername, loginPassword)
    if (isUserAuthenticated === false ) {res.redirect('/');}
    // let sessionKey = User.provideSessionKey()
    // sessionStorage.setItem('key', 'value');
    res.redirect('/posts');
  }
};

module.exports = HomeController;