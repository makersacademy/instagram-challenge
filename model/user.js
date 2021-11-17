/* eslint-disable comma-dangle */
const usersDatabase = require("./databaseLogic/usersDatabase");

class User {
  constructor(usersDatabaseClass = usersDatabase) {
    this.usersDatabaseClass = usersDatabaseClass;
  }

  async addUser(username, password, email) {
    // extract out this logic if possible
    if (User.isThereAnyBlankInputs(username, email) === true) {
      throw new Error("Please fill in all boxes");
    }
    if ((await this.isUsernameTaken(username)) === true) {
      throw new Error("username already in use");
    }
    if ((await this.isEmailTaken(email)) === true) {
      throw new Error("email already in use");
    }
    if (User.isPasswordTooShort(password) === true) {
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

  async isUsernameTaken(username) {
    const existingUsers = await this.usersDatabaseClass.findByUsername(
      username
    );
    if (existingUsers.length > 0) {
      return true;
    }
    return false;
  }

  async isEmailTaken(email) {
    const existingUsers = await this.usersDatabaseClass.findByEmail(email);
    if (existingUsers.length > 0) {
      return true;
    }
    return false;
  }

  static isPasswordTooShort(password) {
    if (password.length < 8) {
      return true;
    }
    return false;
  }

  static isThereAnyBlankInputs(username, email) {
    if (username === "" || email === "") {
      return true;
    }
    return false;
  }
}

module.exports = User;
