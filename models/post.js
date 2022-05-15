const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
  url: String,
  caption: String,
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  likes: { type: Number, default: 0 }
},
  {timestamps: true},
);

const Post = mongoose.model("Post", PostSchema);

module.exports = Post;
