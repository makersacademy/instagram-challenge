var express = require("express");
var router = express.Router();

const PostsController = require("../controllers/posts");

router.get('/', PostsController.Index);

module.exports = router