const Comment = require("../model/comments");

const CommentsController = {
  async NewComment(req, res) {
    try {
      if (req.session.authenticated) {
        const { userId } = req.session.user;
        const postId = req.params.id;
        const { newCommentText } = req.body;
        const comment = new Comment();
        await comment.addComment(newCommentText, userId, postId);
        res.redirect(`/posts/${postId}`);
      } else {
        const postId = req.params.id;
        // store user's current page
        req.session.returnTo = `/posts/${postId}`;
        res.redirect("/login");
      }
    } catch (error) {
      console.log(error.message);
    }
  },
};

module.exports = CommentsController;
