const express = require('express');
const { route } = require('.');
const router = express.Router();
const User = require('../models/user');
const passport = require('passport');

const initializePassport = require('../passport-config');
// initializePassport(passport, (email) => User.find((user) => user.email === email));
initializePassport(
	passport,
	(email) =>
		User.findOne({ email: email }, 'email username password', (err, user) => {
			if (err) return handleError(err);
		}),
	(id) => User.findById(id, (err, user) => {})
);

// // Login Route
// router.get('/new', (req, res) => {
// 	res.render('sessions/new');
// });

// router.post('/', (req, res) => {
// 	res.send(`login user ${req.body.username}`);
// });

router.get('/new', checkNotAuthenticated, (req, res) => {
	res.render('sessions/new');
});

router.post(
	'/',
	checkNotAuthenticated,
	passport.authenticate('local', {
		successRedirect: '/',
		failureRedirect: '/new',
		failureFlash: true,
	})
);

router.delete('/destroy', (req, res) => {
	if (req.isAuthenticated()) {
		return next();
	}
});

// function checkAuthenticated(req, res, next) {
// 	if (req.isAuthenticated()) {
// 		return next();
// 	}

// 	res.redirect('/new');
// }

function checkNotAuthenticated(req, res, next) {
	if (req.isAuthenticated()) {
		return res.redirect('/');
	}
	next();
}

module.exports = router;
