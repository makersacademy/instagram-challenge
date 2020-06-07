// for the backend server, routes refer to the API routes
// the routes that return the JSON files!

const express = require('express')

const router = express.Router();

const InstaPost = require('../models/instaPost');
// required the model so we can use below in our routes == so the routes can actually
// refer to the database.
// Router essentially replaces app.

router.get('/', (req, res) => {
  // referring back to the model - where we will do our finds and creates etc.
  InstaPost.find({ })
  .then((data) => {
    console.log('Data: ', data);
    res.json(data);
    // the THEN returns the data from the database into the json file at the API route.
    // its a way for us to see the data in json format.
  })
  .catch((error) => {
    console.log('error: ', error);
    // the error is here to catch any issues in case we cannot return data for the db.
  });
  // respond by providing the info from the database via a json file - with its own url.
});

// To get the data from front end and save it to the server,
// we need to create a post request, as well as a get request. This links back
// to the appPost component.

router.post('/save', (req, res) => {
  const data = req.body;

  const newInstaPost = new InstaPost(data);

  newInstaPost.save((error) => {
    if (error){
      res.status(500).json({msg: 'Internal sever errors'});
      return;
    }
      return; res.json({
        msg: 'Your data has been saved!'
      });
  });
});
  // so we can see the information (data) that is coming in from the request

router.get('/name', (req, res) => {
  const data = {
    username: 'paterson',
    age: 5
  };
  res.json(data);
});


module.exports = router;
