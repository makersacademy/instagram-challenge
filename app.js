var express = require('express');
var app = express();
var port = 3000;

var cookieParser = require('cookie-parser');
// not using the following:
var createError = require('http-errors');
var path = require('path');
var logger = require('morgan');

// routes
var mainRouter = require('./routes/index');
var postsRouter = require('./routes/posts');
var signupRouter = require('./routes/signup');

// view setup
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.json());

// set up routes
app.use('/', mainRouter);
app.use('/posts', postsRouter);
app.use('/signup', signupRouter);

app.listen(port, function() {
  console.log('Example app listening at http://localhost:3000');
});

module.exports = app;
