const User = require("../models/user");

// Below is used for encrypting password
const CryptoJS = require('crypto-js');
const encryptWithAES = (text) => {
  var passphrase = process.env.SALT || '123';
  return CryptoJS.AES.encrypt(text, passphrase).toString();
};
// End of encryption

const UsersController = {
  New: (req, res) => {
    res.render("users/new", {user: req.session.user});
  },

  Create: (req, res) => {
    const user = new User({email: req.body.email, password: encryptWithAES(req.body.password)});
    user.save((err) => {
      if (err) {
        if (err.name === "ValidationError") {
          res.status(409).send("Email already in use");
        } else {
          res.status(400).send("Oops, something went wrong!");
        }
      } else {
        req.session.user = user
        res.status(201).redirect("/posts");
      }
    });
  },
};

module.exports = UsersController;
