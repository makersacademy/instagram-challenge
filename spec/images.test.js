const Image = require('../models/images')
const fs = require('fs')
var path = require('path');
var mongoose = require("mongoose");

describe('Image Model', () => {
  beforeAll(function (done) {
    mongoose.connect("mongodb://0.0.0.0/instagram_test",
      { useNewUrlParser: true, useUnifiedTopology: true }, err => {
          console.log('connected to test database')
      });

    var db = mongoose.connection;
    db.on("error", console.error.bind(console, "MongoDB connection error:"));
    db.on("open", function () {
      done();
    });
  });

  afterAll(function (done) {
    mongoose.connection.close(true, function () {
      done();
    });
  });

  it('creates an image object',() => {
    const fakeImage = new Image({ 
      name: "an image",
      desc: 'very nice',
      img: {
        data: fs.readFileSync(path.join(__dirname, '..' + '/uploads/' + 'image-for-test')),
        contentType: 'image/png'
      }   });
    expect(fakeImage.name).toEqual ("an image");
  })

  it('saves an image to the datbase',(done) => {
    const fakeImage = new Image({ 
      name: "an image",
      desc: 'very nice',
      img: {
        data: fs.readFileSync(path.join(__dirname, '..' + '/uploads/' + 'image-for-test')),
        contentType: 'image/png'
      }   });
    fakeImage.save((err) => {
      expect(err).toBeNull();

      Image.find({}, (err, items) => {
          expect(err).toBeNull(); 
          expect(items[0].name).toEqual("an image");
          expect(items[0].desc).toEqual("very nice");
          done()
      })
    })
  })
})
