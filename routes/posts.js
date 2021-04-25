const { response } = require('express');
const express = require('express');
const { route } = require('.');
const router = express.Router();
const Post = require('../models/post');
const multer = require('multer');
const path = require('path');
const { fs } = require('fs');
const uploadPath = path.join('public', Post.imageBasePath);
const mime = require('mime-types');
const storage = multer.diskStorage({
	destination: (req, file, callback) => {
		callback(null, uploadPath);
	},
	filename: (req, file, callback) => {
		callback(null, Date.now() + '.' + mime.extension(file.mimetype));
	},
});
const upload = multer({
	storage: storage,
});

// All Posts Route
router.get('/', async (req, res) => {
	try {
		const posts = await Post.find({}).populate('user', 'username -_id').sort({ createdAt: -1 }).exec(); //.select('imagePath imageRelPath user');
		res.render('posts/index', { posts: posts });
	} catch {
		res.render('post/index', { errorMessage: 'Error loading posts' });
	}
});

// New Post Route
router.get('/new', (req, res) => {
	res.render('posts/new');
});

// Create Post Route
router.post('/', upload.single('image'), async (req, res) => {
	if (req.file != null) {
		const post = new Post({
			imagePath: req.file.filename,
			user: req.session.user,
		});
		try {
			const newPost = await post.save();
			res.redirect('posts');
		} catch {
			if (req.file != null) {
				fs.unlink(req.file.destination + req.file.filename, (err) => {
					if (err) console.error(err);
				});
			}
			res.render('posts/new', {
				errorMessage: 'Unable to create post',
			});
		}
	} else {
		res.render('posts/new');
	}
	res.send('new post');
});

module.exports = router;
