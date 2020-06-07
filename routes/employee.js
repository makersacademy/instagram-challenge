const express = require('express');
const postRouter = express.Router();
const Post = require ('..model/Post');

// crud

// read
postRouter.get('/', (req, req)=>{
  Post.find({}, (err, response) =>{
    if(err)  
      response.status(500).json({message: {
        msgBody: "Unable to get posts",
        msgError: true
      }});
    else 
      res.status(200).json(response);
  });
});

//create
postRouter.post('/', (req,res)=>{
  const post = new Post (req.body);
  post.save((err, document)=>{
    if(err) 
    response.status(500).json({message: {
      msgBody: "Unable to add post",
      msgError: true
    }});
    else
    res.status(200).json({message:{
      msgBody: "successfully added post"
    }});
  });
});

postRouter.delete('/:id', (req, res)=>{
  Post.findByIdAndDelete(req.params.id, err =>{
    if(err) 
    response.status(500).json({message: {
      msgBody: "Unable to delete post",
      msgError: true
    }});
    else
    res.status(200).json({message:{
      msgBody: "successfully deleted post"
    }});
  })
});

// update
postRouter.put('/:id', (res,res) => {
  post.FindOneAndUpdate(req.params.id, req.body, {runValidators: true}, (error, response)=> {
    if(err) 
    response.status(500).json({message: {
      msgBody: "Unable to update post",
      msgError: true
    }});
    else
    res.status(200).json({message:{
      msgBody: "successfully updated"
    }});
  })
});

module.exports = postRouter;