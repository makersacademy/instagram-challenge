const express = require('express');
const mongoose = require('mongoose');
const morgan = require('morgan');
var path = require('path');
const cors = require('cors');
var createError = require('http-errors');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
// Also installed concurrently which lets you run two servers at once from the same terminal!
// used so we can grab data in the front end and do a post request to the database
const app = express();
const port = process.env.PORT ||8080

const MONGODB_URI = 'mongodb+srv://lizzieturney:lizzieturney@cluster0.mvuap.mongodb.net/<dbname>?retryWrites=true&w=majority';
// doesn't seem to like my remote link with atlas. Will use local, like below:

mongoose.connect('mongodb://localhost/insta_table', {
  // this means we originally connect to mongo ATLAS but can connect locally as a fall back
  useNewUrlParser: true,
  useUnifiedTopology:true
});

// Schema:
const Schema = mongoose.Schema;
const InstaPostSchema = new Schema({
  image: String ,
  caption: String,
  date: {
    type: String,
    default: Date.now()
  }
});

// Model:

const InstaPost = mongoose.model('InstaPost', InstaPostSchema);

// Saving data to our mongo db app:
const data = {
  image: "first image",
  caption: "first insta page",
  date: Date.now()
}

const newInstaPost = new InstaPost(data);
// instance of the model. ^^

// newInstaPost.save((error) => {
//   if (error) {
//     console.log("oops there is an error");
//   } else {
//     console.log('Data has been saved!');
//   }
// });

// lizzieturney - password
// this connects us to mongodb.

mongoose.connection.on('connected', () => {
  console.log("mongoose is connected!");
});

// middlewear - for the json
app.use(morgan('tiny'));
// morgan logs all of our http requests in the terminal.
// It is sometimes referred to as logger because it logs the http requests.
app.use(cors());
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// app.post("/addpost", (req, res) => {
//  var myData = new User(req.body);
//  myData.save()
//  .then(item => {
//  res.send("item saved to database");
//  })
//  .catch(err => {
//  res.status(400).send("unable to save to database");
//  });
// });


app.get('/api', (req, res) => {

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
  })

  res.json(data)
  // respond by providing the info from the database via a json file - with its own url.
});

app.listen(port, () => {
    console.log(`server is running on port: ${port}`);
    // using back ticks
});
