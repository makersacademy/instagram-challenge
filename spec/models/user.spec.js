const mongoose = require("mongoose");

require("../mongodb_helper");
const User = require("../../models/user");

let user;

describe("User model", () => {
  beforeEach((done) => {
    mongoose.connection.collections.users.drop(() => {
      done();
    });
  })
  beforeEach( async () => {
    user = new User({name: 'testuser'})
    await user.save();
  })

  it("has a name", () => {
    expect(user.name).toEqual("testuser");
  });
})
