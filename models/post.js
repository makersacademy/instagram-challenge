const mongoose = require("mongoose");

const PhotoSchema = new mongoose.Schema({
  name: String,
  caption: String, 
  likes: { type: Number, default: 0 },
  img:
  {
    data: Buffer,
    contentType: String
  }
});

const Photo = mongoose.model("Photo", PhotoSchema);
module.exports = Photo;
