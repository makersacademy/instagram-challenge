const HomeController = {
  Index(req, res) {
    return res.redirect("/posts");
  },
};

module.exports = HomeController;
