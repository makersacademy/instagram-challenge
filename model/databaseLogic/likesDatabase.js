const connection = require('../../database/connection');

class likesDatabase {
  static async findLikesbyPostId(postId) {
    const likes = await connection.pool.query(
      'SELECT * FROM likes WHERE post_id = $1 ;',
      [postId]
    );
    return likes.rows;
  }

  static async addLike(userId, postId) {
    return connection.pool.query(
      'INSERT INTO likes (user_id, post_id) VALUES ($1, $2);',
      [userId, postId]
    );
  }
}

module.exports = likesDatabase;
