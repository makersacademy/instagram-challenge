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

// set up routes
app.use('/', mainController);
app.use('/posts', postsController);
app.use('/signup', signupController);

app.listen(port, function() {
  console.log('Example app listening at http://localhost:3000');
});

module.exports = app;
