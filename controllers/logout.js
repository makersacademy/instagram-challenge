const LogoutController = {
  Logout(req, res) {
    req.session.destroy();
    res.redirect("/posts");
  },
};

module.exports = LogoutController;
