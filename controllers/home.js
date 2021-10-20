const HomeController = {
  Index(req, res) {
    res.redirect('/posts');
  },
};

module.exports = HomeController;
