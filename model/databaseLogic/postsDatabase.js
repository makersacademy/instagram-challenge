/* eslint-disable comma-dangle */
const connection = require("../../database/connection");

class postsDatabase {
  static async newPost(text, userId) {
    const newPost = await connection.pool.query(
      "INSERT INTO posts(text, user_id) VALUES($1, $2) RETURNING id, text, user_id;",
      [text, userId]
    );
    return newPost.rows;
  }

  static async all() {
    const allPosts = await connection.pool.query(
      "SELECT posts.id, posts.text, posts.created_at, posts.user_id, users.username FROM posts INNER JOIN users ON posts.user_id=users.id ORDER BY id DESC"
    );
    return allPosts.rows;
  }

  static async findById(id) {
    const matchingPost = await connection.pool.query(
      "SELECT posts.id, posts.text, posts.created_at, posts.user_id, users.username FROM posts INNER JOIN users ON posts.user_id=users.id WHERE posts.id = $1;",
      [id]
    );
    return matchingPost.rows;
  }
}

module.exports = postsDatabase;
