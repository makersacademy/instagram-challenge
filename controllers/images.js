const Image = require("../models/image");

const ImagesController = {
  Index: (req, res) => {
    Image
    .find( (err, images) => {
      if (err) {
        throw err;
      }
      
      images.forEach((image) => {
        image.imageedAt = image.createdAt.toLocaleString();
      })

      res.render("images/index", { images: images,
          title: "Instagram",
          name: req.session.user.name,
          username: req.session.user.username
      });
    }).populate('user')
      .sort({createdAt: -1 }) 
      .exec(function(err, images) {
        if(err) throw err;
        images.forEach((image) => {
          console.log(image.user.name);
        })
      })
  },
  New: (req, res) => {
    res.render("images/new", {});
  },
  Create: (req, res) => {
    req.body.user = req.session.user._id;
    req.body.imageed_by = req.session.user.email;
    req.body.likes = 0;
    const image = new image(req.body);
    image.save((err) => {
      if (err) {
        throw err;
      }
      res.status(201).redirect("/images");
    });
  },
  Test: (req, res) => {
    res.send("Here")
  },
  Like: (req, res) => {
     
    Image
    .findOneAndUpdate(
      {_id: req.body.imageId}, {$inc:{likes: 1}}, {new: true},
      (err) => {
      if (err) {
        throw err;
      }
      //console.log(update);
      res.status(201).redirect("/images")
    });

  }
};

module.exports = ImagesController;
