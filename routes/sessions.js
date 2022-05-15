var express = require("express");
var router = express.Router();

const SessionsController = require("../controllers/sessions");

router.post("/", SessionsController.Create);
router.delete("/", SessionsController.Destroy);

module.exports = router;