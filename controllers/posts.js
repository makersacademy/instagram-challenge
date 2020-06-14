var express = require('express');
var router = express.Router();
var path = require('path');
var multer = require('multer');
var cors = require('cors');
var fs = require('fs');
var Post = require('../models/post');
var bodyParser = require('body-parser');

router.use(cors());

// set up for file upload:
var storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, 'public/uploads');
  },
  filename: function(req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now())
  }
})

var upload = multer({ storage: storage });

router.get('/', (req, res) => {
  res.sendFile(path.join(__dirname + '/../public/index.html'))
})

// file upload route:
router.post('/', upload.single('image'), function(req, res, next) {
    var newPost = new Post({
        userName: "Zsofi",
        img:
          {
            data: fs.readFileSync(path.join(__dirname +'/../public/uploads/' + req.file.filename)),
            contentType: 'image/png'
          }
    });

    newPost.save(function(err) {
      if (err) { console.log(err) }
      res.send("saved!");
    })
  })

router.get('/feed', (req, res) => {
    Post.find({}, function(err, result) {
      res.send(result);
    })

})

router.get('/feed/img', (req, res) => {
  Post.findOne({ _id: req.query.img}, (err, post) => {
    res.send({binary: post.img.data.toString('base64')})
  })
})

module.exports = router;
