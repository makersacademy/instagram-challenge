const mongoose = require('mongoose');


// Schema:
const Schema = mongoose.Schema;
const InstaPostSchema = new Schema({
  image: String,
  caption: String,
  date: {
    type: String,
    default: Date.now()
  }
});

// Model:

const InstaPost = mongoose.model('InstaPost', InstaPostSchema);

module.exports = InstaPost;
