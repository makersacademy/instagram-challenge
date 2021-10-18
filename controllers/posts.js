const Post = require('../model/posts');
const Like = require('../model/likes');
const Comment = require('../model/comments');

const PostsController = {
  async Index(req, res) {
    try {
      const { username } = req.session.user;
      // const username = 'test'; // use this when I don't want to keep logging in
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
      const { username } = req.session.user;
      // const username = 'test'; // use this when I don't want to keep logging in
      const post = new Post();
      const comment = new Comment();
      const like = new Like();
      const selectedPost = await post.getPostById(postId);
      const numberOfLikes = await like.getLikesByPostId(postId);
      const comments = await comment.getCommentsByPostId(postId);
      res.render('posts/show', {
        selectedPost,
        username,
        numberOfLikes,
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
      res.redirect('/posts');
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = PostsController;
