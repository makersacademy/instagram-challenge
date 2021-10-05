const connection = require('../../database/connection');

class postsDatabase {
  static newPost(text, user_id) {
    return connection.pool.query(
      'INSERT INTO posts(text, user_id) VALUES($1, $2) RETURNING id, text, user_id;',
      [text, user_id]
    );
  }

  static async all() {
    const allPosts = await connection.pool.query(
      'SELECT * FROM posts ORDER BY id ASC'
    );
    return allPosts.rows;
  }

  static findById(id) {
    return connection.pool.query('SELECT * FROM posts WHERE id = $1;', [id]);
  }
}

module.exports = postsDatabase;
