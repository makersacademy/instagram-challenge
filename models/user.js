const mongoose = require("mongoose");
const uniqueValidator = require('mongoose-unique-validator');

const UserSchema = new mongoose.Schema({
  email: { type: String, unique: true },
  password: String,
});

const User = mongoose.model("User", UserSchema);

UserSchema.plugin(uniqueValidator);

module.exports = User;
