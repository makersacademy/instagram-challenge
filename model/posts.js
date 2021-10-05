const postsDatabase = require('./databaseLogic/postsDatabase');

class Post {
  constructor(postsDatabaseClass = postsDatabase) {
    this.postsDatabaseClass = postsDatabaseClass;
  }

  async addPost(text, userId) {
    const newPost = await this.postsDatabaseClass.newPost(text, userId);
    return {
      id: newPost[0].id,
      text: newPost[0].text,
      userID: newPost[0].user_id,
    };
  }

  async getPosts() {
    const allPosts = await this.postsDatabaseClass.all();
    return allPosts.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
    }));

    // This should return something like the following:
    // [{postId: 1, postText: "blah", postComments: [comment1, comment 2], postLikes: 10},
    // {postId: 2, postText: "blah again", postComments: [comment1, comment 2], postLikes: 5}]
  }

  async getPostById(id) {
    const post = await this.postsDatabaseClass.findById(id);
    return {
      id: post[0].id,
      text: post[0].text,
      userID: post[0].user_id,
    };
  }
}

module.exports = Post;
