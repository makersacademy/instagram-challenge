var express = require("express");
var router = express.Router();
const photosController = require("../controllers").photos;

/* GET photos listing. */
router.get("/", function (req, res, next) {
  res.render("photos/index", { title: "photos route" });
});

/* GET  create photo form. */
router.get("/new", function (req, res, next) {
  res.render("photos/new", { title: "Add a photo" });
});

/* POST create photo  */
router.post("/", async (req, res) => {
  let response = await photosController.create(req, res);
  if (response === true) {
    res.redirect("/photos");
  }
});

module.exports = router;
