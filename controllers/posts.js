const { Schema } = require("mongoose");
const { post } = require("../app");
const Post = require("../models/post");
const mongoose = require('mongoose');

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
      url: req.body.url,
      caption: req.body.caption,
      user: req.session.user._id
    }
    const post = new Post(postInfo);
    post.save((err) => {
      if (err) {
        throw err;
      }
      res.status(201).redirect("/posts");
    });
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
