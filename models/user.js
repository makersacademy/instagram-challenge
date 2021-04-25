const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
	email: { type: String, unique: true, required: true },
	username: { type: String, unique: true, required: true },
	password: { type: String, required: true },
});

module.exports = mongoose.model('users', userSchema);
