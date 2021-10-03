const { pool } = require('../database/connection');
const User = require('../model/user');

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

test('adds User to the db', async () => {
  await User.addUser('testuser', 'testpassword', 'test@test.com');
  data = await User.getUsers();
  expect(data.length).toStrictEqual(2);
});

test('returns new user', async () => {
  const newUser = await User.addUser(
    'testuser',
    'testpassword',
    'test@test.com'
  );
  expect(newUser.username).toStrictEqual('testuser');
});
