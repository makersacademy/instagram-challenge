const connection = require('../database/connection.js');

class Post {
  static async addPost(text, user_id) {
    const newPost = await connection.pool.query(
      'INSERT INTO posts(text, user_id) VALUES($1, $2) RETURNING id, text, user_id;',
      [text, user_id]
    );
    return {
      id: newPost.rows[0].id,
      text: newPost.rows[0].text,
      userID: newPost.rows[0].user_id,
    };
  }

  static async getPosts() {
    const allPosts = await connection.pool.query(
      "SELECT * FROM posts ORDER BY id ASC"
    );
    return allPosts.rows.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
    }));
  }

  static async getPostById(id) {
    const post = await connection.pool.query(
      'SELECT * FROM posts WHERE id = $1;',
      [id],
    );
    return {
      id: post.rows[0].id,
      text: post.rows[0].text,
      userID: post.rows[0].user_id,
    };
  }
}

module.exports = Post;
