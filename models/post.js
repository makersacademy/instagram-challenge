const mongoose = require('mongoose');
const imageBasePath = '/uploads/';
const path = require('path');
const User = require('./user');

const postSchema = new mongoose.Schema({
	imagePath: { type: String, required: true },
	createdAt: { type: Date, required: true, default: Date.now },
	user: {
		type: mongoose.Schema.Types.ObjectId,
		required: true,
		ref: 'users',
	},
});

postSchema.set('toObject', { virtuals: true });
postSchema.set('toJSON', { virtuals: true });

postSchema.virtual('imageRelPath').get(function () {
	console.log(imageBasePath + this.imagePath);
	return imageBasePath + this.imagePath;
});

module.exports = mongoose.model('posts', postSchema);
module.exports.imageBasePath = imageBasePath;
