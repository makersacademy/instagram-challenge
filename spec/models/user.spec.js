const mongoose = require("mongoose");

require("../mongodb_helper");
const User = require('../../models/user');

describe("User", () => {
  beforeEach((done) => {
    mongoose.connection.collections.users.drop(() => {
      done();
    });
  });

  it("has a username, email and password", () => {
    const user = new User({
      username: "user1",
      email: "user1@email.co.uk",
      password: "password"
    });
    
    expect(user.username).toEqual("user1");
    expect(user.email).toEqual("user1@email.co.uk");
    expect(user.password).toEqual("password");
  });
});