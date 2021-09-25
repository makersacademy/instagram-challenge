const Like = require('../model/likes');

const LikesController = {
  async NewLike(req, res) {
    try {
      await Like.addLike(6, req.body.postId);
      res.redirect(302, 'back');
    } catch (error) {
      console.log(error.message);
    }
  },
};

module.exports = LikesController;
