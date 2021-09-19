const Photo = require("../models").Photo;

const create = async (req, res) => {
  try {
    await Photo.create({
      image: req.body.image,
      text: req.body.text,
      userId: req.body.userId,
    });
    return true;
  } catch (error) {
    return res.status(400).send(error.message);
  }
};

module.exports = {
  create,
};
