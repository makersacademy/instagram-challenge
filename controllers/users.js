const User = require('../models/user')

const UsersController = {
  All: async (req, res) => {
    try {
      const users = await User.find({})
      res.render('users/index', {users: users});
    } catch {
      res.redirect('/')
    }
    
  },
  New: (req, res) => {
    res.render('users/new', { user: new User() });
  },
  Create: async (req, res) => {
    const user = new User({
      name: req.body.name
    })
    try {
      const newUser = await user.save()
      res.redirect('users')
    } catch {
      res.render('users/new', {
        user: user,
        errorMessage: 'Error creating User'
      })
    }
  }
};

module.exports = UsersController;