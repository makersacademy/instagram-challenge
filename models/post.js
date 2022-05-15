const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
  url: String,
  caption: { type: String, required: true },
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  likes: { type: Number, default: 0 }
});

const Post = mongoose.model("Post", PostSchema);

module.exports = Post;
