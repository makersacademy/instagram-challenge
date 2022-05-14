const mongoose = require("mongoose");

const PostSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
},
  {timestamps: true},
);

const Post = mongoose.model("Post", PostSchema);

module.exports = Post;
