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
      username: "test",
      email: "someone@example.com",
      password: "$2a$12$ccAirt0cv9bFCRk.SnD0Bef3n1tgzbkwz2R/V3MfYm88QjXwlZ5G6",
      bio: "blablabla"
    });
  });

  it("has an email address", () => {
    expect(user.email).toEqual("someone@example.com");
  });

  //encrypted now
  it("has a password", () => {
    expect(user.password).toEqual("$2a$12$ccAirt0cv9bFCRk.SnD0Bef3n1tgzbkwz2R/V3MfYm88QjXwlZ5G6");
  });

  it("can list all users", (done) => {
    User.find((err, users) => {
      expect(err).toBeNull();
      expect(users).toEqual([]);
      done();
    });
  });

  it("can save a user", (done) => {

    user.save((err) => {
      expect(err).toBeNull();

      User.find((err, users) => {
        expect(err).toBeNull();

        expect(users[0]).toMatchObject({
          name: "testuser",
          username: "test",
          email: "someone@example.com",
          password: "$2a$12$ccAirt0cv9bFCRk.SnD0Bef3n1tgzbkwz2R/V3MfYm88QjXwlZ5G6",
          bio: "blablabla"
        });
        done();
      });
    });
  });
});
