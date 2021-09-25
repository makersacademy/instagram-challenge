const connection = require('../database/connection');

class Comment {
  static async addComment(text, userId, postId) {
    return connection.pool.query(
      'INSERT INTO comments (text, user_id, post_id) VALUES ($1, $2, $3);',
      [text, userId, postId]
    );
  }

  static async getCommentsByPostId(postId) {
    const comments = await connection.pool.query(
      'SELECT * FROM comments WHERE id = $1;',
      [postId]
    );
    return comments.rows.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
      createdAt: element.created_at,
    }));
  }
}
module.exports = Comment;
