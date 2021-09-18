var express = require("express");
var router = express.Router();

/* GET photos listing. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "photos route" });
});

module.exports = router;
