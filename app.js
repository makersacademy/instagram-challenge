var express = require('express');
var app = express();
var port = 3000;

var multer = require('multer');
var cors = require('cors');

var cookieParser = require('cookie-parser');
// not using the following:
var createError = require('http-errors');
var path = require('path');
var logger = require('morgan');

// routes
var mainController = require('./controllers/index');
var postsController  = require('./controllers/posts');
var signupController = require('./controllers/signup');


// view setup
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.json());
app.use(cors());

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

// set up routes
app.use('/', mainController);
app.use('/posts', postsController);
app.use('/signup', signupController);

// file upload route:
app.post('/upload', function(req, res) {
  upload(req, res, function(err) {
    if (err instanceof multer.MulterError) {
      return res.status(500).json(err)
    } else if (err) {
      return res.status(500).json(err)
    }
  return res.status(200).send(req.file)
  })
})

app.listen(port, function() {
  console.log('Example app listening at http://localhost:3000');
});

module.exports = app;
