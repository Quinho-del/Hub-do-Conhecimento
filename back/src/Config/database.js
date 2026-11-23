const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '..', '..', '.env') });
const { Pool } = require('pg');

/**
 * Suporta:
 * 1) DATABASE_URL (Supabase / produção) — connection string completa
 * 2) Variáveis separadas DB_USER, DB_HOST, etc. (desenvolvimento local)
 */
function buildPoolConfig() {
  if (process.env.DATABASE_URL) {
    return {
      connectionString: process.env.DATABASE_URL,
      ssl: process.env.DB_SSL === 'false' ? false : { rejectUnauthorized: false },
    };
  }

  const dbPassword = process.env.DB_PASSWORD ? String(process.env.DB_PASSWORD) : undefined;
  const dbPort = Number.isNaN(Number(process.env.DB_PORT)) ? 5432 : parseInt(process.env.DB_PORT, 10);

  if (!dbPassword) {
    console.error('❌ Erro: defina DATABASE_URL (Supabase) ou DB_PASSWORD no arquivo .env');
  }

  return {
    user: process.env.DB_USER,
    host: process.env.DB_HOST || 'localhost',
    database: process.env.DB_NAME,
    password: dbPassword,
    port: dbPort,
    ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : undefined,
  };
}

const pool = new Pool(buildPoolConfig());

pool.connect((erro, client, release) => {
  if (erro) {
    console.error('❌ Erro ao conectar ao PostgreSQL:', erro.message);
    console.error('💡 Verifique DATABASE_URL ou as credenciais no .env');
  } else {
    const origem = process.env.DATABASE_URL ? 'Supabase/Cloud' : process.env.DB_HOST || 'localhost';
    console.log('✅ Conectado ao PostgreSQL com sucesso!');
    console.log(`📊 Banco: ${process.env.DB_NAME || '(via DATABASE_URL)'}`);
    console.log(`🏠 Host: ${origem}`);
    release();
  }
});

module.exports = pool;
