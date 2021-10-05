const postsDatabase = require('./databaseLogic/postsDatabase');

class Post {
  constructor(postsDatabaseClass = postsDatabase) {
    this.postsDatabaseClass = postsDatabaseClass;
  }

  async addPost(text, userId) {
    const newPost = await this.postsDatabaseClass.newPost(text, userId);
    return {
      id: newPost.rows[0].id,
      text: newPost.rows[0].text,
      userID: newPost.rows[0].user_id,
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
      id: post.rows[0].id,
      text: post.rows[0].text,
      userID: post.rows[0].user_id,
    };
  }
}

module.exports = Post;
