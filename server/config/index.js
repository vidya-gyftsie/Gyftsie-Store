require("dotenv").config();
const { Pool } = require("pg");

const isProduction = process.env.NODE_ENV === "production";
const database =
  process.env.NODE_ENV === "test"
    ? process.env.POSTGRES_DB_TEST
    : process.env.POSTGRES_DB;

let connectionString = '';
if (isProduction) {
  connectionString = 'postgresql://gyftsie_app:password@gyftsie-store.cxaukzo5ss7k.us-west-1.rds.amazonaws.com:5432/gyftsietest'
} else {
  connectionString = `postgresql://${process.env.POSTGRES_USER}:${process.env.POSTGRES_PASSWORD}@${process.env.POSTGRES_HOST}:${process.env.POSTGRES_PORT}/${database}`;
}
const pool = new Pool({
  connectionString,
  /*
    SSL is not supported in development
    */
  ssl: false /*isProduction ? {rejectUnauthorized: false } : false*/,
});

module.exports = {
  query: (text, params) => pool.query(text, params),
  end: () => pool.end(),
};
