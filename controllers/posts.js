const { Schema } = require("mongoose");
const { post } = require("../app");
const Post = require("../models/post");
const mongoose = require('mongoose');
var fs = require('fs');
var path = require('path');
var multer = require('multer');

/**
 * setup multer for storing uploaded files
 */
var storage = multer.diskStorage({
  destination: (req, file, cb) => {
      cb(null, 'uploads')
  },
  filename: (req, file, cb) => {
      cb(null, file.fieldname + '-' + Date.now())
  }
});

var upload = multer({ storage: storage });

const PostsController = {
  Index: (req, res) => {
    Post.find({}, (err, posts) => {
      if (err) {
        throw err;
      }
      let reverse = posts.reverse()
      res.render("posts/index", { 
        posts: reverse, 
        user: req.session.user 
      });
    });
  },
  New: (req, res) => {
    res.render("posts/new", { user: req.session.user });
  },
  Create: (req, res) => {
    console.log(req.body)
    var postInfo = {
      name: req.body.name,
      desc: req.body.desc,
      // img: {
      //   data: fs.readFileSync(path.join(__dirname + '/uploads/' + req.file.filename)),
      //   contentType: 'image/png'
      // },
      user: req.session.user._id
    }
    const post = new Post(postInfo);
    post.save((err) => {
      if (err) {
        throw err;
      }
      res.status(201).redirect("/posts");
    });
    // Post.create(postInfo, (err, image) => {
    //   if (err) {
    //     console.log(err);
    //   }
    //   else {
    //     image.save();
    //     res.status(201).redirect("/posts");
    //   }
    // });
  }, 
  
  Delete: (req, res) => {
    Post.findByIdAndRemove(req.params.id, 
      function(err, docs) {
        if(err) res.json(err);
        else res.status(201).redirect("/posts");
      })
  }
}  
       

module.exports = PostsController;
