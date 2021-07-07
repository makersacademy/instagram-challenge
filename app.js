var express = require('express');
var app = express();
var port = 3000;

require('dotenv').config();

var multer = require('multer');
var cors = require('cors');
var mongoose = require('mongoose');
var cookieParser = require('cookie-parser');
var GridFsStorage = require('multer-gridfs-storage');
var Grid = require('gridfs-stream');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var path = require('path');

// not using the following:
var createError = require('http-errors');
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
app.use(bodyParser.json());
app.use(methodOverride('_method'));

// set up routes
app.use('/', mainController);
app.use('/posts', postsController);
app.use('/signup', signupController);

// mongoose connect
const mongoURI = process.env.MONGO_URI;
mongoose.connect(mongoURI, {useNewUrlParser: true, useUnifiedTopology: true}, err => {
  console.log('connected')
});

app.listen(port, function() {
  console.log('Example app listening at http://localhost:3000');
});

module.exports = app;
