const likesDatabase = require('./databaseLogic/likesDatabase');

class Like {
  constructor(likesDatabaseClass = likesDatabase) {
    this.likesDatabaseClass = likesDatabaseClass;
  }

  async addLike(userId, postId) {
    return this.likesDatabaseClass.addLike(userId, postId);
  }

  async getLikesByPostId(postId) {
    return this.likesDatabaseClass.findLikesbyPostId(postId);
  }
}
module.exports = Like;
