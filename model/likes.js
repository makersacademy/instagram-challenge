const connection = require('../database/connection');

class Like {
  // extract out database logic - same as Post class
  static async addLike(userId, postId) {
    return connection.pool.query(
      'INSERT INTO likes (user_id, post_id) VALUES ($1, $2);',
      [userId, postId]
    );
  }

  static async getLikesByPostId(postId) {
    const likes = await connection.pool.query(
      'SELECT * FROM likes WHERE id = $1;',
      [postId]
    );
    return likes.rows.length;
  }
}
module.exports = Like;
