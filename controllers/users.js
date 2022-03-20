const User = require("../models/user");
const bcrypt = require("bcrypt")
const saltRounds = 10;

const UsersController = {

  Create: (req, res) => {
    console.log("In the create controller")
    
    const hash = bcrypt.hashSync(req.body.password, saltRounds);
    req.body.password = hash
    console.log("Before Instantiation of new user", req.body.password )
    const user = new User({username:req.body.username, email:req.body.email, password:req.body.password});
    // User.create({username:req.body.username, email:req.body.email, password:req.body.password}), function(err, user){
    //   if (err) {
    //     throw err;
    //   }
    //   return res.json(user)
    // }
    
    console.log("Created a User", user)

    // user.save(function (err) {
    //   if (err) return handleError(err);
    //   // saved!
    // });

    user.save((err, result) => {
      if (err) {
        throw err;
      }
      res.json(result)
    });
  },

};

module.exports = UsersController;
