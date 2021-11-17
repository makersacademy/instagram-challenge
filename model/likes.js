const likesDatabase = require("./databaseLogic/likesDatabase");

class Like {
  constructor(likesDatabaseClass = likesDatabase) {
    this.likesDatabaseClass = likesDatabaseClass;
  }

  async addLike(userId, postId) {
    return this.likesDatabaseClass.addLike(userId, postId);
  }

  async getLikesByPostId(postId) {
    const numberOfLikes = await this.likesDatabaseClass.findLikesbyPostId(
      // eslint-disable-next-line comma-dangle
      postId
    );
    return numberOfLikes.length;
  }
}
module.exports = Like;
