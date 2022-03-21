const Post = require('../models/post')

const PostsController = {
  Index: (req, res) => {
    Post.find((err, posts) => {
      if (err) {
        throw err
      }

      res.json(posts)
    })
  },

  Create: (req, res) => {
    const post = new Post({ message: req.body.message })
    post.save((err, result) => {
      if (err) {
        throw err
      }

      res.json(result)
    });
  },


};

module.exports = PostsController;
