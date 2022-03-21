const Image = require('../models/image')


const ImagesController = {
  All: async (req, res) => {
    try{
      const images = await Image.find({})
      res.render('images/index', {
        images: images
      });
    } catch {
      res.redirect("/")
    }
    
  },
  New: (req, res) => {
    try {
      res.render('images/new', { 
        user: req.session.user._id,
        title: req.body.title
      });
    } catch {
      res.redirect('/images')
      
    }
  },
  Create: async (req, res) => {
    const filename = req.file != null ? req.file.filename : null
    const image = new Image({
      title: req.body.title,
      user: req.session.user._id,
      image: filename
    })
    console.log(image)
    try {
      const newImage = await image.save()
      res.redirect('images')
    } catch {
      console.log("huh?")
    }

  }
};

module.exports = ImagesController;