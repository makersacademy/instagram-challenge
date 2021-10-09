const commentsDatabase = require('./databaseLogic/postsDatabase');

class Comment {
  constructor(commentsDatabaseClass = commentsDatabase) {
    this.commmentsDatabaseClass = commentsDatabaseClass;
  }

  async addComment(text, userId, postId) {
    const newComment = await this.commmentsDatabaseClass.addComment(
      text,
      userId,
      postId
    );
    return newComment;
  }

  static async getCommentsByPostId(postId) {
    const comments = await this.commentsDatabaseClass.getComments(postId);
    return comments.rows.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
      createdAt: element.created_at,
    }));
  }
}
module.exports = Comment;
