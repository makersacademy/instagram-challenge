var express = require('express');
var router = express.Router();
var path = require('path');
var multer = require('multer');
var cors = require('cors');

router.use(cors());

// set up for file upload:
var storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, 'public/uploads');
  },
  filename: function(req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname)
  }
})

var upload = multer({ storage: storage }).single('file')

router.get('/', (req, res) => {
  res.sendFile(path.join(__dirname + '/../public/posts.html'))
})

// file upload route:
router.post('/', function(req, res) {
  upload(req, res, function(err) {
    if (err instanceof multer.MulterError) {
      return res.status(500).json(err)
    } else if (err) {
      return res.status(500).json(err)
    }
  return res.status(200).send(req.file)
  })
})

module.exports = router;
