fdescribe('postDatabase', () => {
  const connection = require('../../database/connection');
  require('./databasehelpers');

  beforeEach(async () => {});

  describe('test', () => {
    it('test', async () => {
      const test = await connection.pool.query('SELECT * FROM posts');
      console.log(test.rows);
    });
  });
});
