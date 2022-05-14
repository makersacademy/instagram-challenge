const HomeController = {
  Index: (req, res) => {
    res.render("home/index", { title: "Acebook" });
  },
};

module.exports = HomeController;
