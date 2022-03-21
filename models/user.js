const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  name: String,
  username: String,
  email: String,
  password: String,
  bio: String,
});

const User = mongoose.model("User", UserSchema);

module.exports = User;
