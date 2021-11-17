const LogoutController = {
  Logout(req, res) {
    req.session.destroy();
    return res.redirect("/posts");
  },
};

module.exports = LogoutController;
