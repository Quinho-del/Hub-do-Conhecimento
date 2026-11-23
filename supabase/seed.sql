-- Seed mínimo compatível com o modelo atual
-- Rode DEPOIS do schema.sql, no mesmo SQL Editor do Supabase

INSERT INTO topico (nome, descricao) VALUES
  ('Estatística', 'Média, mediana e interpretação de dados'),
  ('Porcentagem', 'Descontos, acréscimos e proporções'),
  ('Álgebra', 'Equações e expressões'),
  ('Geometria', 'Áreas e figuras planas')
ON CONFLICT (nome) DO NOTHING;

INSERT INTO vestibular (nome, ano) VALUES
  ('ENEM', 2023),
  ('ENEM', 2022),
  ('FUVEST', 2023);

INSERT INTO resposta (resposta_correta, explicacao) VALUES
  ('C', 'Some os valores e divida pela quantidade: (6+8+10)/3 = 8.'),
  ('A', '15% de 200 = 30. Valor final: 200 - 30 = 170.'),
  ('C', '2x = 18 - 6 → 2x = 12 → x = 6.'),
  ('C', 'Área = base × altura = 5 × 8 = 40 cm².');

INSERT INTO questao (enunciado, referencias, nivel_de_dificuldade, idtopico, vestibular, idresposta)
SELECT
  q.enunciado, q.ref, q.diff,
  t.idt, v.idv, r.idr
FROM (VALUES
  (
    'As notas de Ana foram 6, 8 e 10. Qual é a média?
A) 6
B) 7
C) 8
D) 9',
    'Material interno', 'Fácil', 'Estatística', 'ENEM', 2023, 1
  ),
  (
    'Um produto de R$ 200 recebeu desconto de 15%. Qual é o novo valor?
A) R$ 170
B) R$ 175
C) R$ 180
D) R$ 185',
    'Material interno', 'Fácil', 'Porcentagem', 'ENEM', 2022, 2
  ),
  (
    'Resolva: 2x + 6 = 18. Qual o valor de x?
A) 4
B) 5
C) 6
D) 7',
    'Material interno', 'Médio', 'Álgebra', 'FUVEST', 2023, 3
  ),
  (
    'Um retângulo tem lados 5 cm e 8 cm. Qual a área?
A) 13 cm²
B) 26 cm²
C) 40 cm²
D) 45 cm²',
    'Material interno', 'Fácil', 'Geometria', 'ENEM', 2023, 4
  )
) AS q(enunciado, ref, diff, topico, vest_nome, vest_ano, resp_ord)
JOIN topico t ON t.nome = q.topico
JOIN vestibular v ON v.nome = q.vest_nome AND v.ano = q.vest_ano
JOIN resposta r ON r.idr = q.resp_ord;
