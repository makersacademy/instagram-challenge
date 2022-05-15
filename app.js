var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const session = require("express-session");
const methodOverride = require("method-override");
var hbs = require('hbs');
const moment = require('moment');
const multer=require('multer');
var bodyParser = require('body-parser');

const homeRouter = require("./routes/home");
const postsRouter = require("./routes/posts");
const sessionsRouter = require("./routes/sessions");
const usersRouter = require("./routes/users");

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(methodOverride("_method"));
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

app.use(
  session({
    key: "user_sid",
    secret: "super_secret",
    resave: false,
    saveUninitialized: false,
    cookie: {
      expires: 600000,
    },
  })
);

// Helper functions
hbs.registerHelper('formatDate', function(dateString) {
  return new hbs.SafeString(
      'at ' + moment(dateString).format("HH:mm") +' on ' + moment(dateString).format("MMM D") + ' ' + moment(dateString).format("YYYY")
  );
});

hbs.registerHelper('ifEqual', function(userId, postId) {
  if (userId === postId) {
    return true
  } 
  return false
})

// clear the cookies after user logs out
app.use((req, res, next) => {
  if (req.cookies.user_sid && !req.session.user) {
    res.clearCookie("user_sid");
  }
  next();
});

// middleware function to check for logged-in users
const sessionChecker = (req, res, next) => {
  if (!req.session.user && !req.cookies.user_sid) {
    res.redirect("/sessions/new");
  } else {
    next();
  }
};

// route setup
app.use("/", homeRouter);
app.use("/posts", sessionChecker, postsRouter);
app.use("/sessions", sessionsRouter);
app.use("/users", usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
