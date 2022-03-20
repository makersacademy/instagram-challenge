const mongoose = require("mongoose");

require("../mongodb_helper");
const User = require("../../models/user");

let user;

describe("User model", () => {
  beforeEach((done) => {
    mongoose.connection.collections.users.drop(() => {
      done();
    });
    user = new User({
      name: "testuser",
    });
  })

  it("has a name", () => {
    expect(user.name).toEqual("testuser");
  });
})
