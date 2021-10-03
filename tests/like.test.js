const { pool } = require('../database/connection');
const Comment = require('../model/comments');
const Like = require('../model/likes');

let data;
beforeEach(async () => {
  pool.connect();
  await pool.query(
    'TRUNCATE TABLE users, posts, likes, comments RESTART IDENTITY;'
  );
  return await pool.query(
    "INSERT INTO users(username, password, email) VALUES('dandelion', 'Password1', 'test@test.com'); INSERT INTO posts(text, created_at, user_id) VALUES('testtesttest', current_timestamp, 1);"
  );
});

afterAll(() => {
  pool.end();
});

test('adds new comment', async () => {
  await Comment.addComment('this a new comment', '1', '1');
  data = await Comment.getCommentsByPostId(1);
  expect(data.length).toStrictEqual(1);
});

test('adds new like', async () => {
  await Like.addLike('1', '1');
  likes = await Like.getLikesByPostId(1);
  expect(likes).toStrictEqual(1);
});
