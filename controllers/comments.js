const Comment = require('../model/comments');

const CommentsController = {
  async NewComment(req, res) {
    try {
      const comment = new Comment();
      await comment.addComment('3t4t43', 1, 1);
      res.redirect(302, 'back');
    } catch (error) {
      console.log(error.message);
    }
  },
};

module.exports = CommentsController;
