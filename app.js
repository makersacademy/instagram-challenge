const createError = require("http-errors");
const express = require("express");
const app = express();
const cors = require("cors");

const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
//const session = require("express-session");
const methodOverride = require("method-override");
app.use(express.urlencoded({extended: true}))
app.use(express.json())
//const postsRouter = require("./routes/posts");
//const sessionsRouter = require("./routes/sessions");
//const usersRouter = require("./routes/users");

// route setup
//app.use("/posts", postsRouter);
//app.use("/sessions", sessionsRouter);
//app.use("/users", usersRouter);

const userRoute = require('./routes/users')

app.use(cors());

app.use('/users', userRoute)

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
//app.use(express.static(path.join(__dirname, 'build'))); 
app.use(methodOverride("_method"));

// app.use(
//   session({
//     key: "user_sid",
//     secret: "super_secret",
//     resave: false,
//     saveUninitialized: false,
//     cookie: {
//       expires: 600000,
//     },
//   })
// );

// clear the cookies after user logs out
app.use((req, res, next) => {
  if (req.cookies.user_sid && !req.session.user) {
    res.clearCookie("user_sid");
  }
  next();
});

// middleware function to check for logged-in users
// const sessionChecker = (req, res, next) => {
//   if (!req.session.user && !req.cookies.user_sid) {
//     res.redirect("/sessions/new");
//   } else {
//     next();
//   }
// };

// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError(404));
});

// error handler
app.use((err, req, res) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});


module.exports = app;
