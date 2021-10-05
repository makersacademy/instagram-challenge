const connection = require('../../database/connection');

class usersDatabase {
  static async findByUsername(username) {
    const matchingUser = await connection.pool.query(
      'SELECT * FROM users WHERE username = $1',
      [username]
    );
    return matchingUser.rows;
  }
}

module.exports = usersDatabase;
