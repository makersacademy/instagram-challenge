const express = require("express");
const router = express.Router();

const Image = require('../models/image')
const path = require('path')
const multer = require('multer')
const uploadTo = path.join('public', Image.imagePath)
const imageMimeTypes = ['image/jpeg', 'image/png'];
const upload = multer({
  dest: uploadTo,
  fileFilter: (req, file, callback) => {
    callback(null, imageMimeTypes.includes(file.mimetype))
  }
})

const ImagesController = require("../controllers/images");

router.get('/', ImagesController.All);
router.get('/new', ImagesController.New);
router.post('/', upload.single('image'), ImagesController.Create);

module.exports = router;