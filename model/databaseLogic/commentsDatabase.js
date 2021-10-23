/* eslint-disable comma-dangle */
const connection = require("../../database/connection");

class commentsDatabase {
  static async getComments(postId) {
    const comments = await connection.pool.query(
      "SELECT * FROM comments WHERE post_id = $1;",
      [postId]
    );
    return comments.rows;
  }

  static async addComment(text, userId, postId) {
    const newComment = await connection.pool.query(
      "INSERT INTO comments (text, user_id, post_id) VALUES ($1, $2, $3) RETURNING id, text, user_id, post_id;",
      [text, userId, postId]
    );
    return newComment.rows;
  }
}

module.exports = commentsDatabase;
