var express = require('express');
var router = express.Router();

const HomeController = require('../controllers/home');

/* GET home page. */
router.get('/', HomeController.Index);

module.exports = router;
