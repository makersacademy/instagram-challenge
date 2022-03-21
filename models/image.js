const mongoose = require('mongoose')

const imagePath = 'uploads/images'
const path = require('path')

const imageSchema = new mongoose.Schema({
  title: { 
    type: String,
    required: true
  },
  image: {
    type: String,
    required: true
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
})

imageSchema.virtual('imagePath').get(function() {
  if (this.image != null) {
    return path.join('/', imagePath, this.image)
  }
})

module.exports = mongoose.model('Image', imageSchema);
module.exports.imagePath = imagePath;
