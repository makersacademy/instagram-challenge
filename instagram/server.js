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

// now we have made our route files, we can make the routes in our server.
const routes = require('./routes/api');

mongoose.connection.on('connected', () => {
  console.log("mongoose is connected!");
});

// middlewear - for the json
app.use(morgan('tiny'));
// morgan logs all of our http requests in the terminal.
// It is sometimes referred to as logger because it logs the http requests.
app.use(cors());
// this enables two different servers to talk to each other
app.use(express.json());
// this is used to save the data from the frontend as json
app.use(bodyParser.json());
// this enables us to turn content in the body (not just url) into json
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/api', routes);
// starting point of the routes variable we created.
// this means when we get to the route file we won't need to prefix
// every request with '/api' because it has already been declared here.

// this is used to save the data from the frontend as json

app.listen(port, () => {
    console.log(`server is running on port: ${port}`);
    // using back ticks
});
