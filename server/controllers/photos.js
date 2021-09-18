const Photo = require("../models").Photo;

module.exports = {
  create(req, res) {
    console.log("here!");
    return Photo.create({
      image: req.query.image,
      text: req.query.text,
      userId: req.query.userId,
    })
      .then((photo) => res.status(201).send(photo))
      .catch((error) => res.status(400).send(error));
  },
};
