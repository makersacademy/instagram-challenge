const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const posts = require('./routes/api/messages');
// server.js
// DB config. this is getting hidden variable from my config file
const db = require('./config/keys').mongoURI;
// requires dependencies
const app = express();
// connect to express


app.use(bodyParser.json());
//Body Parser middleware
// server.js
// Connect to mongoDB
mongoose
  .connect(db)
  //after connection attempt return the following
  .then(() => console.log('MongoDB Connected...'))
  //if it errors then return the error
  .catch(err => console.log(err));

  // Use routes
  app.use('/api/messages', posts);
// now to run server we want to connect to a port. The process.env.PORT allow me to connect to an external server. I have it to go to port 5000 if not.
const port = process.env.PORT || 5000;

app.listen(port, () => console.log('Server started on port '+ port));
// this will listen on this port and callback when it starts on that port
module.exports = app
