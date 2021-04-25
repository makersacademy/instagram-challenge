const express = require('express');
const { route } = require('.');
const router = express.Router();
const User = require('../models/user');
const bcrypt = require('bcrypt');

// Login Route
router.get('/new', (req, res) => {
	res.render('sessions/new', { user: new User() });
});

router.post('/', async (req, res) => {
	try {
		const user = await User.findOne({ email: req.body.email });
		if (await bcrypt.compare(req.body.password, user.password)) {
			req.session.isAuth = true;
			req.session.user = user.id;
			res.redirect('/');
		} else {
			res.render('sessions/new', { user: user, errorMessage: 'Wrong password' });
		}
	} catch {
		res.render('sessions/new', { user: { email: req.body.email }, errorMessage: "Can't find user" });
	}
});

router.get('/destroy', (req, res) => {
	req.session.destroy((err) => {
		if (err) throw err;
		res.redirect('/');
	});
});

module.exports = router;
