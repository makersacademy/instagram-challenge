const postsDatabase = require('./databaseLogic/postsDatabase');

class Post {
  static async addPost(text, user_id) {
    const newPost = await postsDatabase.newPost(text, user_id);
    return {
      id: newPost.rows[0].id,
      text: newPost.rows[0].text,
      userID: newPost.rows[0].user_id,
    };
  }

  static async getPosts() {
    const allPosts = await postsDatabase.all();
    return allPosts.rows.map((element) => ({
      id: element.id,
      text: element.text,
      userID: element.user_id,
    }));
  }

  static async getPostById(id) {
    const post = await postsDatabase.findById(id);
    return {
      id: post.rows[0].id,
      text: post.rows[0].text,
      userID: post.rows[0].user_id,
    };
  }
}

module.exports = Post;
