describe('postDatabase', () => {
  const postsDatabase = require('../../model/databaseLogic/postsDatabase');

  beforeEach(async () => {
    await postsDatabase.newPost('hello', 1);
  });
  describe('test', () => {
    it('test', () => {});
  });
});
