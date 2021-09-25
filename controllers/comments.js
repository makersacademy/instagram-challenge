const Comment = require('../model/comments');

const CommentsController = {
  async NewComment(req, res) {
    try {
      await Comment.addComment(req.body.text, 6, req.body.postId);
      res.redirect(302, 'back');
    } catch (error) {
      console.log(error.message);
    }
  },
};

module.exports = CommentsController;
