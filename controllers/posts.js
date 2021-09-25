const Post = require('../model/posts');

const PostsController = {
  async Index(req, res) {
    try {
      const { username } = req.session.user;
      const posts = await Post.getPosts();
      res.render('posts/index', { posts, username });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async Show(req, res) {
    res.render('posts/show');
  },
  async New(req, res) {
    try {
      const { userId } = req.session.user;
      const { newPostText } = req.body;
      await Post.addPost(newPostText, userId);
      const posts = await Post.getPosts();
      res.render('posts/index', { posts });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async NewComment(req, res) {
    res.json({ info: 'hello new comment post router :)' });
  },
  async NewLike(req, res) {
    res.json({ info: 'hello new like post router :)' });
  },
};

module.exports = PostsController;
