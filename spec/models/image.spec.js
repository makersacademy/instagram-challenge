var mongoose = require("mongoose");

require("../mongodb_helper");
var Image = require("../../models/image");
const User = require("../../models/user")

let userT;

describe("Image model", () => {

  beforeEach((done) => {
    mongoose.connection.collections.images.drop(() => {
      done();
    });
  });
  beforeEach( async () => {
    userT = new User({
      name: "testuser",
      username: "test",
      email: "someone@example.com",
      password: "$2a$12$ccAirt0cv9bFCRk.SnD0Bef3n1tgzbkwz2R/V3MfYm88QjXwlZ5G6",
      bio: "blablabla"
    })
    await userT.save();
  })

  it("a image can hold user referenced details", async () =>{
    let date = new Date("2022-03-16T12:44:46Z")
    let image = new Image({
      message: "some message",
      user: userT._id,
      createdAt: date,
      likes: 4
    })
    await image.save();
    expect(image.message).toEqual("some message");
    expect(image.user).toEqual(userT._id)
    expect(image.createdAt).toEqual(date)
  })

  it("can list all images", (done) => {
    image.find((err, images) => {
      expect(err).toBeNull();
      expect(images).toEqual([]);
      done();
    });
  });

  it("can save a image", (done) => {

    var image = new image({ message: "some message", posted_by: "Ed", user: userT._id, likes: 5});

    image.save((err) => {
      expect(err).toBeNull();

      image.find((err, images) => {
        expect(err).toBeNull();

        expect(images[0]).toMatchObject({ message: "some message" });
        done();
      });
    });
  });
});
