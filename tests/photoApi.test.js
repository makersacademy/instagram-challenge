const { text } = require("express");
const request = require("supertest");
const app = require("../app.js");

describe("photo routes", () => {
  it("should create a new photo", async () => {
    await request(app).post("/users").send({
      name: "TestName",
      email: "test@example.com",
      password: "passw0rd",
    });
    res = await request(app).post("/photos").send({
      image: "placeholder.jpg",
      text: "some descriptive text",
      userId: 1,
    });
    expect(res.statusCode).toEqual(302);
  });

  it("should not create a new photo if not enough params", async () => {
    await request(app).post("/users").send({
      name: "TestName",
      email: "test@example.com",
      password: "passw0rd",
    });
    res = await request(app).post("/photos").send({
      image: "placeholder.jpg",
      text: "some descriptive text",
    });
    expect(res.statusCode).toEqual(400);
  });
});
