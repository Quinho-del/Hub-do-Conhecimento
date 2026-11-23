-- ============================================================
-- Hub do Conhecimento / Vestibular+ — Schema para Supabase
-- Compatível com as queries existentes em buscaModels.js
-- Execute no SQL Editor do Supabase (Dashboard → SQL → New query)
-- NÃO use outro cliente SQL apontando para "database public"
-- ============================================================

-- Tópicos
CREATE TABLE IF NOT EXISTS topico (
  idt         SERIAL PRIMARY KEY,
  nome        TEXT NOT NULL UNIQUE,
  descricao   TEXT
);

-- Vestibulares / anos
CREATE TABLE IF NOT EXISTS vestibular (
  idv         SERIAL PRIMARY KEY,
  nome        TEXT NOT NULL,
  ano         INTEGER
);

-- Respostas (gabarito + explicação)
CREATE TABLE IF NOT EXISTS resposta (
  idr               SERIAL PRIMARY KEY,
  resposta_correta  TEXT NOT NULL,
  explicacao        TEXT
);

-- Questões
CREATE TABLE IF NOT EXISTS questao (
  idq                   SERIAL PRIMARY KEY,
  enunciado             TEXT NOT NULL,
  referencias           TEXT,
  nivel_de_dificuldade  TEXT,
  idtopico              INTEGER REFERENCES topico(idt) ON DELETE SET NULL,
  vestibular            INTEGER REFERENCES vestibular(idv) ON DELETE SET NULL,
  idresposta            INTEGER REFERENCES resposta(idr) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_questao_topico ON questao(idtopico);
CREATE INDEX IF NOT EXISTS idx_questao_vestibular ON questao(vestibular);
CREATE INDEX IF NOT EXISTS idx_questao_dificuldade ON questao(nivel_de_dificuldade);

-- ============================================================
-- RLS (leitura pública das questões)
-- ============================================================
ALTER TABLE topico ENABLE ROW LEVEL SECURITY;
ALTER TABLE vestibular ENABLE ROW LEVEL SECURITY;
ALTER TABLE resposta ENABLE ROW LEVEL SECURITY;
ALTER TABLE questao ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "topico_select" ON topico;
DROP POLICY IF EXISTS "vestibular_select" ON vestibular;
DROP POLICY IF EXISTS "resposta_select" ON resposta;
DROP POLICY IF EXISTS "questao_select" ON questao;

CREATE POLICY "topico_select" ON topico FOR SELECT USING (true);
CREATE POLICY "vestibular_select" ON vestibular FOR SELECT USING (true);
CREATE POLICY "resposta_select" ON resposta FOR SELECT USING (true);
CREATE POLICY "questao_select" ON questao FOR SELECT USING (true);
