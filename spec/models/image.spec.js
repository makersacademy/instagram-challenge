const mongoose = require("mongoose");

require("../mongodb_helper");
const User = require("../../models/user")
const Image = require("../../models/image");

describe("Image model", () => {
  let image;
  let user;
  beforeEach((done) => {
    mongoose.connection.collections.images.drop(() => {
      done();
    });
  })
  beforeEach( async () => {
    user = new User({_id: '6237b2d99aeddc6d6520a34b', name: 'Ed'})
    await user.save();
    image = new Image({
      title: "Test image",
      image: "test.jpg",
      user: user
    });
    await image.save();
  })

  it("has a title", () => {
    expect(image.title).toEqual("Test image");
  });
})
