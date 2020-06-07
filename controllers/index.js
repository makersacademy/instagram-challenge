var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
  // res.send('Pinstagram')
  res.sendFile(path.join(__dirname + '/../public/index.html'))

})

module.exports = router;
