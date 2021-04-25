const express = require('express');
const { route } = require('.');
const router = express.Router();
const User = require('../models/user');
const bcrypt = require('bcrypt');

// All Users Route
router.get('/', async (req, res) => {
	let searchOptions = {};
	if (req.query.username != null && req.query.username !== '') {
		searchOptions.username = new RegExp(req.query.username, 'i');
	}
	try {
		const users = await User.find(searchOptions);
		res.render('users/index', {
			users: users,
			searchOptions: req.query,
		});
	} catch {
		res.redirect('/');
	}
});

// New User Route
router.get('/new', (req, res) => {
	res.render('users/new', { user: new User() });
});

// Create User Route
router.post('/', async (req, res) => {
	const hashedPassword = await bcrypt.hash(req.body.password, 10);
	const user = new User({
		email: req.body.email,
		username: req.body.username,
		password: hashedPassword,
	});
	try {
		const newUser = await user.save();
		req.session.isAuth = true;
		req.session.user = newUser.id;
		res.redirect('/');
	} catch {
		res.render('users/new', {
			user: user,
			errorMessage: 'Unable to create user',
		});
	}
});

module.exports = router;
