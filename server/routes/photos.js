var express = require("express");
var router = express.Router();
const photosController = require("../controllers").photos;

console.log("in the routes");

/* GET photos listing. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "photos route" });
});

/* POST create photo  */
router.post("/", photosController.create);

module.exports = router;
