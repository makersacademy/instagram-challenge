const User = require("../models").User;

const create = async (req, res) => {
  try {
    await User.create({
      name: req.body.name,
      email: req.body.email,
      password: req.body.password,
    });
    return true;
  } catch (error) {
    return res.status(400).send(error.message);
  }
};

module.exports = {
  create,
};
