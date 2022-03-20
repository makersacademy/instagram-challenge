const path = require("path");

const HomeController = {
  Index: (req, res) => {
    res.render("home/index", { title: "Instagram" });
    // return res.sendFile(path.join(`${__dirname}/../views/home/index.hbs`));
  },
};

module.exports = HomeController;
