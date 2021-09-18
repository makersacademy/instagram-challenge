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
    await Post.addPost("blahdeblah")
    let posts = await Post.getPosts();
    console.log(req)
		res.render("posts/index", { posts: posts });
  },
  NewComment: async function (req, res) {
    res.json({ info: "hello new comment post router :)"})
  },
  NewLike: async function (req, res) {
    res.json({ info: "hello new like post router :)"})
  },
}

module.exports = PostsController;