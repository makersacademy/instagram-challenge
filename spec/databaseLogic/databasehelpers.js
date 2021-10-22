const connection = require("../../database/connection");

const databaseTearDown = async () => {
  await connection.pool.query(
    "TRUNCATE TABLE users, posts, comments, likes RESTART IDENTITY"
  );
};

const seedUserData = async (username, password, email) => {
  await connection.pool.query(
    "INSERT INTO users(username, password, email) VALUES($1, $2, $3)",
    [username, password, email]
  );
};

const seedPostData = async (text, userId) => {
  await connection.pool.query(
    "INSERT INTO posts(text, user_id) VALUES($1, $2)",
    [text, userId]
  );
};

const seedCommentData = async (text, userId, postId) => {
  await connection.pool.query(
    "INSERT INTO comments (text, user_id, post_id) VALUES ($1, $2, $3);",
    [text, userId, postId]
  );
};

const seedLikeData = async (userId, postId) => {
  await connection.pool.query(
    "INSERT INTO likes (user_id, post_id) VALUES ($1, $2);",
    [userId, postId]
  );
};

const setupTests = async () => {
  await databaseTearDown();
  await seedUserData("test", "test", "test@test");
  await seedUserData("test2", "test2", "test2@test");
  await seedPostData("test post", 1);
  await seedCommentData("test comment", 1, 1);
  await seedLikeData(1, 1);
};
module.exports = { setupTests };
