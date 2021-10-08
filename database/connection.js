require('dotenv').config();
const { Pool } = require('pg');

let pool;

const testDb = {
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_TEST_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
};

const devDb = {
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
};

if (process.env.NODE_ENV === 'PRODUCTION') {
  pool = new Pool({
    // DATABASE_URL from Heroku
    connectionString: process.env.DATABASE_URL,
    ssl: {
      rejectUnauthorized: false,
    },
  });
} else if (process.env.NODE_ENV === 'test') {
  pool = new Pool(testDb);
} else {
  pool = new Pool(devDb);
}

module.exports.pool = pool;
