const HomeController = {
  Index: async function (req, res) {
    res.render('home/index')
  }
};

module.exports = HomeController;