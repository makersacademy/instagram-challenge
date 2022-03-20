const User = require("../models/user");
const bcrypt = require("bcrypt")
const saltRounds = 10;

const UsersController = {

  Create: (req, res) => {

    const hash = bcrypt.hashSync(req.body.password, saltRounds);
    req.body.password = hash
    const user = new User(req.body);

    user.save((err, result) => {
      if (err) {
        throw err;
      }
      req.session.user = user;
      res.json(result)
    });
  },

};

module.exports = UsersController;
