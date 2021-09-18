const Post = require("../model/posts");

const PostsController = {
  Index: async function(req, res) {
    let posts = await Post.getPosts();
		res.render("posts/index", { posts: posts });
  },
  Show: async function (req,res) {
    res.render('posts/show')
  },
  New: async function (req, res) {
    res.json({ info: "Hello new post router :)" });
  },
  NewComment: async function (req, res) {
    res.json({ info: "hello new comment post router :)"})
  },
  NewLike: async function (req, res) {
    res.json({ info: "hello new like post router :)"})
  },
}

module.exports = PostsController;