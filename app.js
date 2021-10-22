require("dotenv").config();

const express = require("express");
const path = require("path");
const session = require("express-session");

const app = express();
const port = 3000;

const loginRouter = require("./routes/login");
const logoutRouter = require("./routes/logout");
const postsRouter = require("./routes/posts");
const signUpRouter = require("./routes/signup");
const homeRouter = require("./routes/home");

// views engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(express.static(path.join(__dirname, "public")));

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(
  session({
    secret: "f4z4gs$Gcg",
    cookie: { maxAge: 300000000 },
    saveUninitialized: false,
    resave: false,
  })
);

// routes
app.use("/login", loginRouter);
app.use("/logout", logoutRouter);
app.use("/signup", signUpRouter);
app.use("/posts", postsRouter);
app.use("/", homeRouter);

app.listen(process.env.PORT || port, () => {
  // eslint-disable-next-line no-console
  console.log(`App running on port ${process.env.PORT || port}.`);
});
