const postsDatabase = require('./databaseLogic/postsDatabase');
const convertDateToUKFormat = require('./Util');

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
    return allPosts
      .map((element) => ({
        id: element.id,
        text: element.text,
        userID: element.user_id,
        createdDate: convertDateToUKFormat(element.created_at),
      }))
      .reverse();
  }

  async getPostById(id) {
    const post = await this.postsDatabaseClass.findById(id);
    return {
      id: post[0].id,
      text: post[0].text,
      userID: post[0].user_id,
      createdDate: convertDateToUKFormat(post[0].created_at),
    };
  }
}

module.exports = Post;
