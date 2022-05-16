const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
  message: String,
  img:
  {
    data: Buffer,
    contentType: String
  }
});

const Post = mongoose.model("Post", PostSchema);

module.exports = Post;
