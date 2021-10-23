const usersDatabase = require("./databaseLogic/usersDatabase");

class User {
  constructor(usersDatabaseClass = usersDatabase) {
    this.usersDatabaseClass = usersDatabaseClass;
  }

  async addUser(username, password, email) {
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

  // extract out database logic - same as Post class
  // Do I need this method?
  // static async getUsers() {
  //   const allUsers = await connection.pool.query(
  //     'SELECT * FROM users ORDER BY id ASC'
  //   );
  //   return allUsers.rows.map((element) => ({
  //     id: element.id,
  //     username: element.username,
  //     email: element.email,
  //   }));
  // }

  async authenticate(username, password) {
    const result = await this.usersDatabaseClass.findByUsername(username);
    if (result.length === 0) {
      return false;
    }
    if (result[0].password !== password) {
      return false;
    }
    return {
      id: result[0].id,
      username: result[0].username,
      email: result[0].email,
    };
  }
}

module.exports = User;
