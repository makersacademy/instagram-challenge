var express = require('express');
var router = express.Router();
const Image = require('../models/images');
const fs = require('fs')
var path = require('path');

const multer = require('multer');
  
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads')
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '-' + Date.now())
    }
});
  
const upload = multer({ storage: storage });

/* GET home page. */
router.get('/', function(req, res, next) {
  Image.find({}, (err, items) => {
    if (err) {
        console.log(err);
        res.status(500).send('An error occurred', err);
    }
    else {
        res.render('index', { title: 'Instagram', items: items });
    }
  });
});

// process image when form is submitted and redirect to the homepage
router.post('/', upload.single('image'), (req, res, next) => {
  var obj = {
      name: req.body.name,
      desc: req.body.desc,
      img: {
          data: fs.readFileSync(path.join(__dirname, '..' + '/uploads/' + req.file.filename)),
          contentType: 'image/png'
      }
  }
  Image.create(obj, (err, item) => {
      if (err) {
          console.log(err);
      }
      else {
          item.save();
          res.redirect('/');
      }
  });
});

module.exports = router;
