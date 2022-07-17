var express = require('express');
var router = express.Router();

/* GET new post page. */
router.get('/newPost', (req, res, next) => {
  console.log('we got to the router')
  res.render('newPost');
});

module.exports = router;
