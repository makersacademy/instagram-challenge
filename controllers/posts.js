const Post = require('../model/posts');
const Like = require('../model/likes');
const Comment = require('../model/comments');
const helpers = require('../public/javascripts/helpers');

const PostsController = {
  async Index(req, res) {
    try {
      const { username } = 'test'; // change back to: req.session.user;
      const post = new Post();
      const posts = await post.getPosts();
      res.render('posts/index', { posts, username });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async Show(req, res) {
    try {
      const postId = req.params.id;
      const { username } = 'test'; // change back to: req.session.user;
      const post = new Post();
      const selectedPost = await post.getPostById(postId);
      const numberOfLikes = await Like.getLikesByPostId(postId);
      const comments = await Comment.getCommentsByPostId(postId);
      res.render('posts/show', {
        selectedPost,
        username,
        numberOfLikes,
        helpers,
        comments,
      });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async New(req, res) {
    try {
      const { userId } = req.session.user;
      const { newPostText } = req.body;
      const post = new Post();
      await post.addPost(newPostText, userId);
      const posts = await post.getPosts();
      res.render('posts/index', { posts });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async NewLike(req, res) {
    res.json({ info: 'hello new like post router :)' });
  },
};

module.exports = PostsController;
