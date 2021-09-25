const express = require('express');

const postsRouter = express.Router();
const PostsController = require('../controllers/posts');

postsRouter.post('/id/comment/new', PostsController.NewComment);
postsRouter.post('/id/like/new', PostsController.NewLike);
postsRouter.get('/:id', PostsController.Show);
postsRouter.get('/', PostsController.Index);
postsRouter.post('/new', PostsController.New);

module.exports = postsRouter;
