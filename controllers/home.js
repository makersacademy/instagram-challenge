const HomeController = {
  Index: (req, res) => {
    res.render("home/index", { title: "Instagram" });
  },
};

module.exports = HomeController;
