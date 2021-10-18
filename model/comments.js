const commentsDatabase = require('./databaseLogic/commentsDatabase');

class Comment {
  constructor(commentsDatabaseClass = commentsDatabase) {
    this.commentsDatabaseClass = commentsDatabaseClass;
  }

  async addComment(text, userId, postId) {
    console.log('hello model');
    const newComment = await this.commentsDatabaseClass.addComment(
      text,
      userId,
      postId
    );
    return newComment;
  }

  static async getCommentsByPostId(postId) {
    // console.log(this.commentsDatabaseClass);
    const comments = await commentsDatabase.getComments(postId);
    return comments.rows.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
      createdAt: element.created_at,
    }));
  }
}
module.exports = Comment;
