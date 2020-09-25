const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body parser');

const app = express();

app.use(bodyParser.json());

// routes
const post = require('/routes/post');
app.use('/post', post);


if(process.env.NODE_ENV === 'production'){

}

mongoose.connect('mongodb://localhost/instagram',
{
  useNewUrlParser: true,
  useFindAndModify: false,
},(err) => {
  if (err) {
    process.exit(1);
    console.log('unable to connect to database')
  } else {
    console.log('successfully connected to database')
  }
});

const port = process.env.PORT || 5000;

app.listen(port, () => {
  console.log('app is running');
});
