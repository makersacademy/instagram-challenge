const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const PostSchema = new Schema ({
  firstName: {
    type: String,
    required: true
  },
  lastName: {
    type: String,
    required: true
  },
  image: {
    type: String,
    required: true
  },
  likes: {
    type: String,
    required: true
  },
});

module.exports = mongoose.model('Post', PostSchema);