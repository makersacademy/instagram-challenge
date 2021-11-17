/* eslint-disable no-underscore-dangle */
/* eslint-disable comma-dangle */
const User = require("../model/user");

describe("User", () => {
  let usersDatabaseMock;
  let userInstance;
  let mockUsersData;

  beforeEach(() => {
    usersDatabaseMock = jasmine.createSpyObj("usersDatabase", [
      "findByUsername",
      "addUser",
      "findByEmail",
    ]);
    mockUsersData = [
      {
        id: 2,
        username: "test",
        password: "test",
        email: "test",
        photo_url: null,
      },
    ];
    usersDatabaseMock.addUser.and.callFake(() => mockUsersData);
    usersDatabaseMock.findByUsername.and.callFake(() => mockUsersData);
    usersDatabaseMock.findByEmail.and.callFake(() => mockUsersData);
    userInstance = new User(usersDatabaseMock);
  });

  describe("#authenticate", () => {
    it("should call correct method in usersDb with correct argument", async () => {
      await userInstance.authenticate("test", "test");
      expect(usersDatabaseMock.findByUsername).toHaveBeenCalledWith("test");
    });
    it("should return array with length 1 for authenticated user", async () => {
      const authenticatedUser = await userInstance.authenticate("test", "test");
      expect(authenticatedUser).toEqual({
        id: 2,
        username: "test",
        email: "test",
      });
    });

    it("should return throw correct error for incorrect username", async () => {
      usersDatabaseMock.findByUsername.and.callFake(() => []);
      let error;
      try {
        await userInstance.authenticate("wrong username", "test");
      } catch (e) {
        error = e;
      }
      const expectedError = new Error("incorrect username");
      expect(error).toEqual(expectedError);
    });

    it("should return throw correct error for incorrect password", async () => {
      let error;
      try {
        await userInstance.authenticate("test", "wrong password");
      } catch (e) {
        error = e;
      }
      const expectedError = new Error("incorrect password");
      expect(error).toEqual(expectedError);
    });
  });

  describe("#addUser", () => {
    it("should call correct method in usersDb with correct argument", async () => {
      usersDatabaseMock.findByUsername.and.callFake(() => []);
      usersDatabaseMock.findByEmail.and.callFake(() => []);
      await userInstance.addUser("test", "test2test", "test@test");
      expect(usersDatabaseMock.addUser).toHaveBeenCalledWith(
        "test",
        "test2test",
        "test@test"
      );
    });
  });

  describe("#isUsernameTaken", () => {
    it("should return true since username is already taken", async () => {
      expect(await userInstance._isUsernameTaken("test")).toEqual(true);
    });
    it("should return false since username is already taken", async () => {
      usersDatabaseMock.findByUsername.and.callFake(() => []);
      expect(await userInstance._isUsernameTaken("test-not-take")).toEqual(
        false
      );
    });
  });

  describe("#isEmailTaken", () => {
    it("should return true since email is already taken", async () => {
      expect(await userInstance._isEmailTaken("test@test")).toEqual(true);
    });
    it("should return false since username is already taken", async () => {
      usersDatabaseMock.findByEmail.and.callFake(() => []);
      expect(await userInstance._isEmailTaken("test-not-taken@test")).toEqual(
        false
      );
    });
  });

  describe("#isPasswordTooshot", () => {
    it("should return true when password above 8 characters", async () => {
      expect(User._isPasswordTooShort("passwordisok")).toEqual(false);
    });
    it("should return true when password is 8 characters", async () => {
      expect(User._isPasswordTooShort("password")).toEqual(false);
    });
    it("should return false when password is below 8 characters", async () => {
      expect(User._isPasswordTooShort("2short")).toEqual(true);
    });
  });

  describe("#isThereAnyBlankInputs", () => {
    it("should return true when username is blank", async () => {
      expect(User._isThereAnyBlankInputs("", "test@test")).toEqual(true);
    });

    it("should return false when username is not blank", async () => {
      expect(User._isThereAnyBlankInputs("notblank", "test@test")).toEqual(
        false
      );
    });

    it("should return true when email is blank", async () => {
      expect(User._isThereAnyBlankInputs("test", "")).toEqual(true);
    });

    it("should return false when email is not blank", async () => {
      expect(User._isThereAnyBlankInputs("test", "notblank")).toEqual(false);
    });
  });
});
