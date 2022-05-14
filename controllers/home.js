const HomeController = {
  Index: (req, res) => {
    res.render("home/index", { title: "Instagram", user: req.session.user });
  },
};

module.exports = HomeController;