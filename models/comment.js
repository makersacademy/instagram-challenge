const mongoose = require("mongoose");

const CommentSchema = new mongoose.Schema({
  message: String,
  post: { type: mongoose.Schema.Types.ObjectId, ref: 'Post' },
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
},
  {timestamps: true},
);

module.exports = mongoose.model("Comment", CommentSchema);
