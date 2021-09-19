const db = require("./server/models/index");

beforeEach(async () => {
  await db.sequelize.truncate({ cascade: true, restartIdentity: true });
});

afterAll(async () => {
  await db.sequelize.close();
});
