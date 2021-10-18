const Like = require('../model/likes');

const LikesController = {
  async NewLike(req, res) {
    const userId = req.session.user;
    const postId = req.params.id;
    const like = new Like();
    await like.addLike(userId, postId);
    res.redirect(`/posts/${postId}`);
  },
};

module.exports = LikesController;
