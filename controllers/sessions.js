const User = require("../models/user");

// Below used for decryption on passwords
const CryptoJS = require('crypto-js');
const decryptWithAES = (ciphertext) => {
  var passphrase = process.env.SALT || '123';
  const bytes = CryptoJS.AES.decrypt(ciphertext, passphrase);
  const originalText = bytes.toString(CryptoJS.enc.Utf8);
  return originalText;
};
// End of decryption

const SessionsController = {
  New: (req, res) => {
    res.render("sessions/new", {user: req.session.user});
  },

  Create: (req, res) => {
    console.log("trying to log in");
    const email = req.body.email;
    const password = req.body.password;

    User.findOne({ email: email }).then((user) => {
      if (!user) {
        res.redirect("/sessions/new");
      } else if (decryptWithAES(user.password) != password) {
        res.redirect("/sessions/new");
      } else {
        req.session.user = user;
        res.redirect("/posts");
      }
    });
  },

  Destroy: (req, res) => {
    console.log("logging out");
    if (req.session.user && req.cookies.user_sid) {
      res.clearCookie("user_sid");
    }
    res.redirect("/sessions/new");
  },
};

module.exports = SessionsController;
