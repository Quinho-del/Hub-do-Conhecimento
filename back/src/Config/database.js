const path = require('path');
const { Pool } = require('pg');

require('dotenv').config({ path: path.resolve(__dirname, '..', '..', '.env') });

function buildPoolConfig() {
  if (process.env.DATABASE_URL) {
    return {
      connectionString: process.env.DATABASE_URL,
      ssl: process.env.DB_SSL === 'false' ? false : { rejectUnauthorized: false },
      max: Number(process.env.DB_POOL_MAX || 5),
      connectionTimeoutMillis: Number(process.env.DB_CONNECTION_TIMEOUT || 10000),
      idleTimeoutMillis: Number(process.env.DB_IDLE_TIMEOUT || 30000),
      keepAlive: true,
    };
  }

  if (!process.env.DB_PASSWORD) {
    throw new Error('Defina DATABASE_URL (Supabase) ou DB_PASSWORD no ambiente.');
  }

  return {
    user: process.env.DB_USER || 'postgres',
    host: process.env.DB_HOST || 'localhost',
    database: process.env.DB_NAME || 'postgres',
    password: process.env.DB_PASSWORD,
    port: Number(process.env.DB_PORT || 5432),
    ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : undefined,
    max: Number(process.env.DB_POOL_MAX || 5),
    connectionTimeoutMillis: Number(process.env.DB_CONNECTION_TIMEOUT || 10000),
    idleTimeoutMillis: Number(process.env.DB_IDLE_TIMEOUT || 30000),
    keepAlive: true,
  };
}

const pool = new Pool(buildPoolConfig());

pool.on('error', (error) => {
  console.error('Erro inesperado no pool PostgreSQL:', error.message);
});

module.exports = pool;
