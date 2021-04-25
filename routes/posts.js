const { response } = require('express');
const express = require('express');
const { route } = require('.');
const router = express.Router();
const Post = require('../models/post');
const multer = require('multer');
const path = require('path');
const { fs } = require('fs');
const uploadPath = path.join('public', Post.imageBasePath);
const imageMineTypes = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'];
const upload = multer({
	dest: uploadPath,
	// fileFilter: (req, file, callback) => {
	// 	console.log('upload: ', file.minetype);
	// 	callback(null, imageMineTypes.includes(file.minetype));
	// },
});

// All Posts Route
router.get('/', async (req, res) => {
	try {
		const posts = await Post.find({}).populate('user', 'username -_id').select('imagePath user');
		console.log('---------------');
		console.log(posts);
		console.log('---------------');
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
	console.log('--------------------------');
	console.log(req.file.path);
	console.log('user:', req.session.user);
	console.log('--------------------------');
	if (req.file != null) {
		const post = new Post({
			imagePath: req.file.path,
			user: req.session.user,
		});
		try {
			const newPost = await post.save();
			res.redirect('posts');
		} catch {
			if (req.file != null) {
				fs.unlink(req.file.path, (err) => {
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
