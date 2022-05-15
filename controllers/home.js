const homeController = {
  Index: function(req, res, next) {
    res.render('home/index', { title: 'Fakestagram' });
  },
};

module.exports = homeController;