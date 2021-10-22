const Like = require("../model/likes");

const LikesController = {
  async NewLike(req, res) {
    try {
      if (req.session.authenticated) {
        const { userId } = req.session.user;
        const postId = req.params.id;
        const like = new Like();
        await like.addLike(userId, postId);
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

module.exports = LikesController;
