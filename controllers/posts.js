const Post = require("../model/posts");

const PostsController = {
  async Index(req, res) {
    const posts = await Post.getPosts();
    res.render('posts/index', { posts });
  },
  async Show(req, res) {
    res.render("posts/show");
  },
  async New(req, res) {
    try {
      const { newPostText } = req.body;
      await Post.addPost(newPostText, 1);
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
