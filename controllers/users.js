const User = require("../models/user");
const bcrypt = require("bcrypt")
const saltRounds = 10;

const UsersController = {

  Create: (req, res) => {
    console.log("In the create controller")
    
    const hash = bcrypt.hashSync(req.body.password, saltRounds);
    req.body.password = hash

    const user = new User({username:req.body.username, email:req.body.email, password:req.body.password});

    console.log("Created a User", user)

    user.save((err, result) => {
      if (err) {
        throw err;
      }
      // Returning the hashed password. Should return something different.. probably a session key or similar
      res.json(result)
    });
  },

};

module.exports = UsersController;
