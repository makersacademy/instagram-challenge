const Post = require('../model/posts');
const Like = require('../model/likes');
const Comment = require('../model/comments');

const PostsController = {
  async Index(req, res) {
    try {
      const { session } = req;
      const post = new Post();
      const posts = await post.getPosts();
      res.render('posts/index', { posts, session });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async Show(req, res) {
    try {
      const postId = req.params.id;
      const { session } = req;
      // const username = 'test'; // use this when I don't want to keep logging in
      const post = new Post();
      const comment = new Comment();
      const like = new Like();
      const selectedPost = await post.getPostById(postId);
      const numberOfLikes = await like.getLikesByPostId(postId);
      const comments = await comment.getCommentsByPostId(postId);
      res.render('posts/show', {
        selectedPost,
        session,
        numberOfLikes,
        comments,
      });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
  async New(req, res) {
    try {
      if (req.session.authenticated) {
        const { userId } = req.session.user;
        const { newPostText } = req.body;
        const post = new Post();
        await post.addPost(newPostText, userId);
        res.redirect('/posts');
      } else {
        res.redirect('/login');
      }
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = PostsController;
