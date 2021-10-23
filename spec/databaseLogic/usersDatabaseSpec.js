/* eslint-disable comma-dangle */
const usersDatabase = require("../../model/databaseLogic/usersDatabase");
const { setupTests } = require("./databasehelpers");

describe("usersDatabase", () => {
  let userData;

  beforeEach(setupTests);

  describe("#findByUsername", () => {
    beforeEach(async () => {
      userData = await usersDatabase.findByUsername("test");
    });

    it("returns array of correct length", async () => {
      expect(userData.length).toEqual(1);
    });
    it("returns object with correct keys", async () => {
      expect(Object.keys(userData[0])).toContain("id");
      expect(Object.keys(userData[0])).toContain("username");
      expect(Object.keys(userData[0])).toContain("password");
      expect(Object.keys(userData[0])).toContain("email");
    });

    it("returns correct values in object", async () => {
      expect(userData[0].username).toEqual("test");
      expect(userData[0].id).toEqual(1);
      expect(userData[0].password).toEqual("test");
      expect(userData[0].email).toEqual("test@test");
    });
  });

  describe("#addUser", () => {
    it("returns array of length 1", async () => {
      userData = await usersDatabase.addUser(
        "new test user",
        "new-test-password",
        "newtestemail@test"
      );
      expect(userData.length).toEqual(1);
    });
    it("returns object with correct keys", async () => {
      userData = await usersDatabase.addUser(
        "new test user",
        "new-test-password",
        "newtestemail@test"
      );
      expect(Object.keys(userData[0])).toContain("id");
      expect(Object.keys(userData[0])).toContain("username");
      expect(Object.keys(userData[0])).toContain("email");
    });

    it("returns correct values in object", async () => {
      userData = await usersDatabase.addUser(
        "new test user",
        "new-test-password",
        "newtestemail@test"
      );
      // expect(userData[0].id).toEqual(1); - returns unpredictable id so removing this line for now
      expect(userData[0].username).toEqual("new test user");
      expect(userData[0].email).toEqual("newtestemail@test");
    });
  });
});
