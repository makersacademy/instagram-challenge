describe('likesDatabase', () => {
  const likesDatabase = require('../../model/databaseLogic/likesDatabase');
  const { setupTests } = require('./databasehelpers');
  let likesData;
  let newLike;

  beforeEach(setupTests);

  describe('#findLikesbyPostId', () => {
    beforeEach(async () => {
      likesData = await likesDatabase.findLikesbyPostId(1);
    });
    it('returns array of correct length', () => {
      expect(likesData.length).toEqual(1);
    });

    it('returns object with correct keys', () => {
      expect(Object.keys(likesData[0])).toContain('id');
      expect(Object.keys(likesData[0])).toContain('post_id');
      expect(Object.keys(likesData[0])).toContain('user_id');
    });
    it('returns correct values in object', () => {
      expect(likesData[0].id).toEqual(1);
      expect(likesData[0].post_id).toEqual(1);
      expect(likesData[0].user_id).toEqual(1);
    });
  });

  describe('#addLike', () => {
    it('returns array of length 1', async () => {
      newLike = await likesDatabase.addLike(1, 1);
      expect(newLike.length).toEqual(1);
    });

    it('returns object with correct keys', async () => {
      newLike = await likesDatabase.addLike(1, 1);
      expect(Object.keys(newLike[0])).toContain('id');
      expect(Object.keys(newLike[0])).toContain('post_id');
      expect(Object.keys(newLike[0])).toContain('user_id');
    });

    it('returns correct values in object', async () => {
      newLike = await likesDatabase.addLike(1, 1);
      expect(newLike[0].id).toEqual(2);
      expect(newLike[0].post_id).toEqual(1);
      expect(newLike[0].user_id).toEqual(1);
    });
  });
});
