const { text } = require("express");
const request = require("supertest");
const app = require("../app.js");

describe("photo routes", () => {
  it("should create a new photo", async () => {
    await request(app).post("/users").query({
      name: "TestName",
      email: "test@example.com",
      password: "passw0rd",
    });
    res = await request(app).post("/photos").query({
      image: "placeholder.jpg",
      text: "some descriptive text",
      userId: 1,
    });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty("image", "placeholder.jpg");
  });
});
