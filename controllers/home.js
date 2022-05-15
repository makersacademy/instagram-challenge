const HomeController = {
  Index: (req, res) => {
    res.render('home/index', { title: 'Fakestagram' });
  },
};

module.exports = HomeController;