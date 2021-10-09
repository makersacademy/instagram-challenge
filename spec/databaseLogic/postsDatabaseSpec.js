fdescribe('postDatabase', () => {
  const postsDatabase = require('../../model/databaseLogic/postsDatabase');
  require('./databasehelpers');
  let postsData;
  describe('#all', () => {
    beforeAll(async () => {
      postsData = await postsDatabase.all();
    });
    it('returns object with correct keys', async () => {
      expect(postsData.length).toEqual(1);
    });

    it('returns object with correct keys', async () => {
      const postsData = await postsDatabase.all();
      expect(Object.keys(postsData[0])).toContain('id');
      expect(Object.keys(postsData[0])).toContain('text');
      expect(Object.keys(postsData[0])).toContain('created_at');
      expect(Object.keys(postsData[0])).toContain('user_id');
    });
  });
});
