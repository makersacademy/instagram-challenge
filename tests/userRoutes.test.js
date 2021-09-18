const request = require("supertest");
const app = require("../app.js");

describe("user routes", () => {
  it("should create a new user", async () => {
    res = await request(app).post("/users").query({
      name: "TestName",
      email: "test@example.com",
      password: "passw0rd",
    });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty("id", 1);
  });
});
