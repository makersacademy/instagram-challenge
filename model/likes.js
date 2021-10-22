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
      postId
    );
    return numberOfLikes.length;
  }
}
module.exports = Like;
