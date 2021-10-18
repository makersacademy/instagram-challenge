const commentsDatabase = require('./databaseLogic/commentsDatabase');

class Comment {
  constructor(commentsDatabaseClass = commentsDatabase) {
    this.commentsDatabaseClass = commentsDatabaseClass;
  }

  async addComment(text, userId, postId) {
    const newComment = await this.commentsDatabaseClass.addComment(
      text,
      userId,
      postId
    );
    return newComment;
  }

  async getCommentsByPostId(postId) {
    const comments = await this.commentsDatabaseClass.getComments(postId);
    return comments.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
      createdAt: element.created_at,
    }));
  }
}
module.exports = Comment;
