const Like = require("../model/likes");

const LikesController = {
  async NewLike(req, res) {
    try {
      if (req.session.authenticated) {
        const { userId } = req.session.user;
        const postId = req.params.id;
        const like = new Like();
        await like.addLike(userId, postId);
        return res.redirect(`/posts/${postId}`);
      }
      const postId = req.params.id;
      // store user's current page
      req.session.returnTo = `/posts/${postId}`;
      return res.redirect("/login");
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = LikesController;
