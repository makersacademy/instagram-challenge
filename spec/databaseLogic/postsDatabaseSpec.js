// come up with better solution for the 'setTimeouts' in this file
describe('postDatabase', () => {
  const postsDatabase = require('../../model/databaseLogic/postsDatabase');
  require('./databasehelpers');
  let postsData;
  let newPost;

  describe('#all', () => {
    beforeAll(async () => {
      postsData = await postsDatabase.all();
    });
    it('returns array of correct length', () => {
      expect(postsData.length).toEqual(1);
    });

    it('returns object with correct keys', () => {
      expect(Object.keys(postsData[0])).toContain('id');
      expect(Object.keys(postsData[0])).toContain('text');
      expect(Object.keys(postsData[0])).toContain('created_at');
      expect(Object.keys(postsData[0])).toContain('user_id');
    });
    it('returns correct values in object', () => {
      expect(postsData[0].text).toEqual('test post');
      expect(postsData[0].id).toEqual(1);
      expect(postsData[0].user_id).toEqual(1);
    });
  });

  describe('#newPost', () => {
    it('returns array of length 1', async () => {
      setTimeout(() => {
        newPost = postsDatabase.newPost('second test post', 1);
        expect(newPost.length).toEqual(1);
      }, 500);
    });
    it('returns object with correct keys', async () => {
      setTimeout(() => {
        newPost = postsDatabase.newPost('second test post', 1);
        expect(Object.keys(postsData[0])).toContain('id');
        expect(Object.keys(postsData[0])).toContain('text');
        expect(Object.keys(postsData[0])).toContain('created_at');
        expect(Object.keys(postsData[0])).toContain('user_id');
      }, 500);
    });

    it('returns correct values in object', async () => {
      setTimeout(() => {
        newPost = postsDatabase.newPost('second test post', 1);
        expect(postsData[0].text).toEqual('second test post');
        expect(postsData[0].id).toEqual(1);
        expect(postsData[0].user_id).toEqual(1);
      }, 500);
    });
  });

  describe('#findById', () => {
    beforeAll(async () => {
      postsData = await postsDatabase.findById(1);
    });
    it('returns array of correct length', () => {
      expect(postsData.length).toEqual(1);
    });
    it('returns object with correct keys', () => {
      expect(Object.keys(postsData[0])).toContain('id');
      expect(Object.keys(postsData[0])).toContain('text');
      expect(Object.keys(postsData[0])).toContain('created_at');
      expect(Object.keys(postsData[0])).toContain('user_id');
    });

    it('returns correct values in object', () => {
      expect(postsData[0].text).toEqual('test post');
      expect(postsData[0].id).toEqual(1);
      expect(postsData[0].user_id).toEqual(1);
    });
  });
});
