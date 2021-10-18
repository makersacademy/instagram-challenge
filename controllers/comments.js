const Comment = require('../model/comments');

const CommentsController = {
  async NewComment(req, res) {
    try {
      const userId = req.session.user;
      const postId = req.params.id;
      const { newCommentText } = req.body;
      const comment = new Comment();
      await comment.addComment(newCommentText, userId, postId);
      res.redirect(`/posts/${postId}`);
    } catch (error) {
      console.log(error.message);
    }
  },
};

module.exports = CommentsController;
