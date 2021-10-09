const connection = require('../../database/connection');

class commentsDatabase {
  static async getComments(postId) {
    const comments = await connection.pool.query(
      'SELECT * FROM comments WHERE id = $1;',
      [postId]
    );
    return comments;
  }

  static async addComment(text, userId, postId) {
    const newComment = connection.pool.query(
      'INSERT INTO comments (text, user_id, post_id) VALUES ($1, $2, $3);',
      [text, userId, postId]
    );
    return newComment;
  }
}

module.exports = commentsDatabase;
