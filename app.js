require("dotenv").config();
process.env.NODE_ENV='development';

const express = require("express");
const path = require("path");
const session = require('express-session')

const app = express();
const port = 3000;

const homeRouter = require("./routes/home")
const postsRouter = require("./routes/posts")
const signUpRouter = require("./routes/signup")

// views engine setup
app.set("views", path.join(__dirname, "views"))
app.set("view engine", "hbs")

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// app.use(session({
//   secret: 'secret-key',
//   resave: false,
//   saveUninitialized: true,
// }));

// routes
app.use("/", homeRouter);
app.use("/posts", postsRouter);
app.use("/signup", signUpRouter);

app.listen(port, () => {
  console.log(`App running on port ${port}`);
})


