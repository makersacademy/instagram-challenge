require('dotenv').config();

const express = require('express');
const path = require('path');
const session = require('express-session');

const app = express();
const port = 3000;

const loginRouter = require('./routes/login');
const postsRouter = require('./routes/posts');
const signUpRouter = require('./routes/signup');

// views engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(
  session({
    secret: 'f4z4gs$Gcg',
    cookie: { maxAge: 300000000 },
    saveUninitialized: false,
    resave: false,
  })
);

// routes
app.use('/login', loginRouter);
app.use('/posts', postsRouter);
app.use('/signup', signUpRouter);

app.listen(process.env.PORT || port, () => {
  console.log(`App running on port ${process.env.PORT || port}.`);
});
