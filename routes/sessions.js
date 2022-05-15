var express = require("express");
var router = express.Router();

const SessionsController = require("../controllers/sessions");

router.post('/', SessionsController.Create);

module.exports = router;