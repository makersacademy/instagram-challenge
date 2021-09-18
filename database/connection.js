const Pool = require('pg').Pool;

let dbInfo;

const testDb = {
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_TEST_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
};

const db = {
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
};

if (process.env['TEST'] = 'test') {
  dbInfo = testDb;
}
else {
  dbInfo = db;
}

const pool = new Pool(dbInfo);

module.exports.pool = pool;