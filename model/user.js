const connection = require('../database/connection.js');

class Post {
  static async addUser(username, password, email) {
    let newUser = await connection.pool.query(
      "INSERT INTO users(username, password, email) VALUES($1, $2, $3) RETURNING id, username, email;", [username, password, email]);
    return { id: newUser.rows[0].id, username: newUser.rows[0].username, password: newUser.rows[0].password, email: newUser.rows[0].email };
  }

  static async getUsers() {
    let allUsers = await connection.pool.query(
      'SELECT * FROM users ORDER BY id ASC'
    );
    return allUsers.rows.map((element) => {
      return { id: element.id, username: element.username, email: element.email };
    });
  }
  static async authenticate(username, password) {
    const result = await connection.pool.query(
      "SELECT * FROM users WHERE username = $1", [username]);
    if (result.rows.length === 0) {return false}
    if (result.rows[0].password !== password) {return false}
    return { id: result.rows[0].id, text: result.rows[0].username, email: result.rows[0].email };
  }

  static provideSessionKey() {
    return '_' + Math.random().toString(36).substr(2, 9);
  }
}

module.exports = Post;
