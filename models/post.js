const mongoose = require('mongoose');

const postSchema = new mongoose.Schema({
	message: { type: String },
	createdAt: { type: Date, required: true, default: Date.now },
	Images: { type: String, required: true },
});

module.exports = mongoose.model('posts', postSchema);
