const express = require('express');
const router = express.Router();

const isAuth = (req, res, next) => {
	if (req.session.isAuth) {
		next();
	} else {
		res.redirect('/sessions/new');
	}
};

router.get('/', isAuth, (req, res) => {
	res.redirect('posts');
});

module.exports = router;
