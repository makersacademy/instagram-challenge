const mongoose = require("mongoose");

const ImageSchema = new mongoose.Schema({
  image:{
    type: String,
    required: true
},
  message: String,
  likes: Number,
  posted_by: String,

  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }
},
{
  timestamps: true
});

const Image = mongoose.model("Image", ImageSchema);

module.exports = Image;

