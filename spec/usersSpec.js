/* eslint-disable comma-dangle */
const User = require("../model/user");

describe("User", () => {
  let usersDatabaseMock;
  let usersDatabaseMockWithNoUser;
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

    it("should return false for incorrect username", async () => {
      usersDatabaseMock.findByUsername.and.callFake(() => []);
      const authenticatedUser = await userInstance.authenticate(
        "wrongusername",
        "test"
      );
      expect(authenticatedUser).toEqual("incorrect username");
    });

    it("should return false for incorrect password", async () => {
      const authenticatedUser = await userInstance.authenticate(
        "test",
        "wrong password"
      );
      expect(authenticatedUser).toEqual("incorrect password");
    });
  });

  describe("#addUser", () => {
    it("should call correct method in usersDb with correct argument", async () => {
      await userInstance.addUser("test", "test", "test@test");
      expect(usersDatabaseMock.addUser).toHaveBeenCalledWith(
        "test",
        "test",
        "test@test"
      );
    });
  });

  describe("#isUsernameTaken", () => {
    it("should return true since username is already taken", async () => {
      expect(await userInstance.isUsernameTaken("test")).toEqual(true);
    });
    it("should return false since username is already taken", async () => {
      usersDatabaseMock.findByUsername.and.callFake(() => []);
      expect(await userInstance.isUsernameTaken("test-not-take")).toEqual(
        false
      );
    });
  });

  describe("#isEmailTaken", () => {
    it("should return true since email is already taken", async () => {
      expect(await userInstance.isEmailTaken("test@test")).toEqual(true);
    });
    it("should return false since username is already taken", async () => {
      usersDatabaseMock.findByEmail.and.callFake(() => []);
      expect(await userInstance.isEmailTaken("test-not-taken@test")).toEqual(
        false
      );
    });
  });

  describe("#isPasswordTooshot", () => {
    it("should return true when password above 8 characters", async () => {
      expect(User.isPasswordTooShort("passwordisok")).toEqual(false);
    });
    it("should return true when password is 8 characters", async () => {
      expect(User.isPasswordTooShort("password")).toEqual(false);
    });
    it("should return false when password is below 8 characters", async () => {
      expect(User.isPasswordTooShort("2short")).toEqual(true);
    });
  });

  describe("#isThereAnyBlankInputs", () => {
    it("should return true when username is blank", async () => {
      expect(User.isThereAnyBlankInputs("", "test@test")).toEqual(true);
    });

    it("should return false when username is not blank", async () => {
      expect(User.isThereAnyBlankInputs("notblank", "test@test")).toEqual(
        false
      );
    });

    it("should return true when email is blank", async () => {
      expect(User.isThereAnyBlankInputs("test", "")).toEqual(true);
    });

    it("should return false when email is not blank", async () => {
      expect(User.isThereAnyBlankInputs("test", "notblank")).toEqual(false);
    });
  });
});
