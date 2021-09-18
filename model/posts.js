const connection = require('../database/connection.js');

class Post {
  static async getPosts() {
    let allPosts = await connection.pool.query(
      'SELECT * FROM posts ORDER BY id ASC'
    );
    return allPosts.rows.map((element) => {
      return { id: element.id, message: element.text, userID: element.user_id };
    });
  }
}

module.exports = Post;
