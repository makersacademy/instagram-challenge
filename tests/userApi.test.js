const request = require("supertest");
const app = require("../app.js");

describe("user api test", () => {
  it("should create a new user", async () => {
    res = await request(app).post("/users").send({
      name: "TestName",
      email: "test@example.com",
      password: "passw0rd",
    });
    expect(res.statusCode).toEqual(302);
  });
});

it("should throw error if incomplete params", async () => {
  res = await request(app).post("/users").send({
    name: "TestName",
    password: "passw0rd",
  });
  expect(res.statusCode).toEqual(400);
});
