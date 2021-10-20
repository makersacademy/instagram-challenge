const LogoutController = {
  Logout(req, res) {
    console.log('controller');
    req.session.destroy();
    res.redirect('/posts');
  },
};

module.exports = LogoutController;
