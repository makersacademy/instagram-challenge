var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var PostSchema = new Schema ({
  // filename: String,
  // originalname: String,
  userName: String,
  datePosted: Date,
  caption: String,
  img:
      {
          data: Buffer,
          contentType: String
      }
});

var Post = mongoose.model('Post', PostSchema);

module.exports = Post;
