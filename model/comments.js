const commentsDatabase = require("./databaseLogic/commentsDatabase");
const util = require("./Util");

class Comment {
  constructor(commentsDatabaseClass = commentsDatabase) {
    this.commentsDatabaseClass = commentsDatabaseClass;
  }

  async addComment(text, userId, postId) {
    const newComment = await this.commentsDatabaseClass.addComment(
      text,
      userId,
      // eslint-disable-next-line comma-dangle
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
      postID: element.post_id,
      createdDate: util.convertDateToUKFormat(element.created_at),
      username: element.username,
    }));
  }
}
module.exports = Comment;
