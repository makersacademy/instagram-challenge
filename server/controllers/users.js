const User = require("../models").User;

module.exports = {
  create(req, res) {
    console.log(req.query);
    return User.create({
      name: req.query.name,
      email: req.query.email,
      password: req.query.password,
    })
      .then((user) => res.status(201).send(user))
      .catch((error) => res.status(400).send(error));
  },
};
