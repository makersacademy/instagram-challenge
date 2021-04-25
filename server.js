if (process.env.NODE_ENV !== 'production') {
	require('dotenv').config();
}

const express = require('express');
const session = require('express-session');
const MongoDBSession = require('connect-mongodb-session')(session);
const app = express();
const expressLayouts = require('express-ejs-layouts');

const indexRouter = require('./routes/index');
const signUpRouter = require('./routes/users');
const loginRouter = require('./routes/sessions');
const postRouter = require('./routes/posts');

app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');
app.set('layout', 'layouts/layout');
app.use(expressLayouts);
app.use(express.static('public'));
app.use(express.urlencoded({ extended: false }));

const mongoose = require('mongoose');
mongoose.connect(process.env.DATABASE_URL, { useNewUrlParser: true });

const db = mongoose.connection;
db.on('error', (error) => console.error(error));
db.once('open', () => console.log('Connected to Mongoose'));

const store = new MongoDBSession({
	uri: process.env.DATABASE_URL,
	collection: 'mySessions',
});

app.use(
	session({
		secret: 'key that will sign cookie',
		resave: false,
		saveUninitialized: false,
		store: store,
	})
);

app.use('/', indexRouter);
app.use('/users', signUpRouter);
app.use('/sessions', loginRouter);
app.use('/posts', postRouter);

app.listen(process.env.PORT || 3000);
