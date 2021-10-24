/* eslint-disable comma-dangle */
const connection = require("../../database/connection");

class commentsDatabase {
  static async getComments(postId) {
    const comments = await connection.pool.query(
      "SELECT comments.id, comments.text, comments.created_at, comments.user_id, comments.post_id, users.username FROM comments INNER JOIN users ON comments.user_id=users.id WHERE post_id = $1;",
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
