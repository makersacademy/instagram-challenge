const mongoose = require("mongoose");

const User = require('../../models/user');
require("../mongodb_helper");

describe("User", () => {
  beforeEach((done) => {
    mongoose.connection.collections.users.drop(() => {
      done();
    });
  });

  it("has a username, email and password", () => {
    const user = new User({
      username: "person1",
      email: "person1@email.co.uk",
      password: "password"
    });
    
    expect(user.username).toEqual("person1");
    expect(user.email).toEqual("person1@email.co.uk");
    expect(user.password).toEqual("password");
  });
});