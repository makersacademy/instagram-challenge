const connection = require('../../database/connection');

class postsDatabase {
  static newPost(text, user_id) {
    return connection.pool.query(
      'INSERT INTO posts(text, user_id) VALUES($1, $2) RETURNING id, text, user_id;',
      [text, user_id]
    );
  }

  static all() {
    return connection.pool.query('SELECT * FROM posts ORDER BY id ASC');
  }

  static findById(id) {
    return connection.pool.query('SELECT * FROM posts WHERE id = $1;', [id]);
  }
}

module.exports = postsDatabase;
