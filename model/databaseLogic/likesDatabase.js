const connection = require("../../database/connection");

class likesDatabase {
  static async findLikesbyPostId(postId) {
    const likes = await connection.pool.query(
      "SELECT * FROM likes WHERE post_id = $1 ;",
      [postId]
    );
    return likes.rows;
  }

  static async addLike(userId, postId) {
    const notLikedByUser = await this._isNotAlreadyLiked(userId, postId);
    if (notLikedByUser) {
      const newLike = await connection.pool.query(
        "INSERT INTO likes (user_id, post_id) VALUES ($1, $2) RETURNING id, user_id, post_id;",
        [userId, postId]
      );
      return newLike.rows;
    }
    return "Post already liked";
  }

  static async _isNotAlreadyLiked(userId, postId) {
    const existingLikes = await likesDatabase.findLikesbyPostId(postId);
    if (existingLikes.filter((e) => e.user_id === userId).length === 0) {
      return true;
    }
    return false;
  }
}

module.exports = likesDatabase;
