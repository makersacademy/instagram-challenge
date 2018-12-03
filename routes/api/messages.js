const express = require('express');
const router = express.Router();

// Item Model
const Posts = require('../../models/Posts')


// @route GET api/items
// @desc Get All items
// @access Public
router.get('/', (req, res) => {
 Posts.find()
   .sort({ date: -1})
   .then(posts => res.json(posts));
});

// routes/api/items.js

// @route POST api/items
// @desc Create a item
// @access Public
router.post('/', (req, res) => {
  const newPost = new Posts({
    message: req.body.message
  });
  newPost.save().then(message => res.json(message));
  // This saves to the database and returns it in json
});

// @route DELETE api/items/:id
// @desc Delete an item
// @access Public
router.delete('/:id', (req, res) => {
  // /:id is a placeholder for what we pass in as an id
  Posts.findById(req.params.id)
  // req.params.id gets id from the params we pass
    .then(post => post.remove().then(() => res.json({ success: true})))
    .catch(err => res.status(404).json({ success: false}));
});

// At the bottom to make this accessible
module.exports = router;
