/* eslint-disable no-underscore-dangle */
/* eslint-disable comma-dangle */
const usersDatabase = require("./databaseLogic/usersDatabase");

class User {
  constructor(usersDatabaseClass = usersDatabase) {
    this.usersDatabaseClass = usersDatabaseClass;
  }

  async addUser(username, password, email) {
    // extract out this logic if possible
    if (User._isThereAnyBlankInputs(username, email) === true) {
      throw new Error("Please fill in all boxes");
    }
    if ((await this._isUsernameTaken(username)) === true) {
      throw new Error("username already in use");
    }
    if ((await this._isEmailTaken(email)) === true) {
      throw new Error("email already in use");
    }
    if (User._isPasswordTooShort(password) === true) {
      throw new Error("password needs to be at least 8 characters");
    }
    const newUser = await this.usersDatabaseClass.addUser(
      username,
      password,
      // eslint-disable-next-line comma-dangle
      email
    );
    return {
      id: newUser[0].id,
      username: newUser[0].username,
      email: newUser[0].email,
    };
  }

  async authenticate(username, password) {
    const result = await this.usersDatabaseClass.findByUsername(username);
    if (result.length === 0) {
      throw new Error("incorrect username");
    }
    if (result[0].password !== password) {
      throw new Error("incorrect password");
    }
    return {
      id: result[0].id,
      username: result[0].username,
      email: result[0].email,
    };
  }

  async _isUsernameTaken(username) {
    const existingUsers = await this.usersDatabaseClass.findByUsername(
      username
    );
    return existingUsers.length > 0;
  }

  async _isEmailTaken(email) {
    const existingUsers = await this.usersDatabaseClass.findByEmail(email);
    return existingUsers.length > 0;
  }

  static _isPasswordTooShort(password) {
    return password.length < 8;
  }

  static _isThereAnyBlankInputs(username, email) {
    return username === "" || email === "";
  }
}

module.exports = User;
