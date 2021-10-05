const connection = require('../../database/connection');

class postsDatabase {
  static async newPost(text, user_id) {
    const newPost = await connection.pool.query(
      'INSERT INTO posts(text, user_id) VALUES($1, $2) RETURNING id, text, user_id;',
      [text, user_id]
    );
    console.log('hello');
    return newPost.rows;
  }

  static async all() {
    const allPosts = await connection.pool.query(
      'SELECT * FROM posts ORDER BY id ASC'
    );
    return allPosts.rows;
  }

  static async findById(id) {
    const matchingPost = await connection.pool.query(
      'SELECT * FROM posts WHERE id = $1;',
      [id]
    );
    return matchingPost.rows;
  }
}

module.exports = postsDatabase;
