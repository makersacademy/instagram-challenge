const mongoose = require('mongoose');
const Schema = mongoose.Schema;
var date = new Date();
// Create Schema
const PostSchema = new Schema({
  message: {
    type: String,
    require: true
  },
  date: {
    type: String,
    default: function formatDate() {
      var d = new Date()
      day = d.getDate()
      month = d.getMonth() + 1
      year = d.getFullYear()
      return `${day}/${month}/${year}`
    }
  }
});

module.exports = Post = mongoose.model('post', PostSchema);
