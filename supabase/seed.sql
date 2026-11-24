INSERT INTO vestibular (nome, ano) VALUES
('ENEM', 2020),   -- 1
('ENEM', 2012),   -- 2
('ENEM', 2019),   -- 3
('FUVEST', 2019), -- 4
('ENEM', 2010),   -- 5
('FUVEST', 2016), -- 6
('PUC', 2016),    -- 7
('ENEM', 2017),   -- 8
('FUVEST', 2021), -- 9
('ENEM', 2023),   -- 10
('ENEM', 2024),   -- 11
('PUC-RS', 2021), -- 12
('FUVEST', 2014), -- 13
('UFPB', 2011),   -- 14
('ENEM', 2003),   -- 15
('ENEM', 2018),   -- 16
('FUVEST', 2024), -- 17
('ENEM', 2016),   -- 18
('ENEM', 2021);   -- 19

-- ------------------------------------------------------------
-- Tópicos (nome UNIQUE — usa a descrição como nome distintivo)
-- ------------------------------------------------------------
INSERT INTO topico (nome, descricao) VALUES
('Análise de gráfico', 'Estatística — análise e interpretação de gráficos'),       -- 1
('Média, moda, mediana', 'Estatística — medidas de tendência central'),           -- 2
('Desvio Padrão', 'Estatística — dispersão e desvio padrão');                      -- 3

-- ============================================================
-- Questões 1–30
-- ============================================================

-- 1
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'A população aumenta de 1950 até 2040, pois a linha do gráfico fica crescente nesse intervalo. Após 2040, ela começa a diminuir.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 1, '1',
'Prever a dinâmica populacional de um país é de extrema importância, pois com esse conhecimento as políticas públicas em saúde, educação, habitação e infraestrutura poderão ser executadas sem atraso e de forma eficiente. A linha cheia no gráfico mostra a evolução da população brasileira desde 1950 até 2010, e a extrapolação (previsão) até o ano 2050, representada pela linha tracejada, foi feita com base nos censos demográficos realizados até 2010.

Pelo gráfico apresentado, o intervalo em que se observa aumento da população é:
A) 1950 a 2010.
B) 1950 a 2040.
C) 1950 a 2050.
D) 2010 a 2040.
E) 2040 a 2050.',
'https://app.soexercicios.com.br/plataforma/questoes-de-vestibular/ENEM/5763425/',
1,
'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTwggF9K8ijqQs0CS6zAA7Lltj5h5Z4oeMsmFU7piNTp4SNik3i');

-- 2
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('E', 'O mês de junho teve a maior venda absoluta (ponto mais alto) e o mês de agosto teve a menor venda absoluta (ponto mais baixo).');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 2, '1',
'O dono de uma farmácia resolveu colocar à vista do público o gráfico mostrado a seguir, que apresenta a evolução do total de vendas (em Reais) de certo medicamento ao longo do ano de 2011.

De acordo com o gráfico, os meses em que ocorreram, respectivamente, a maior e a menor venda absolutas em 2011 foram:
A) março e abril.
B) março e agosto.
C) agosto e setembro.
D) junho e setembro.
E) junho e agosto.',
'https://vestibular.mundoeducacao.uol.com.br/enem/interpretacao-graficos-no-enem.htm',
2,
'https://static.mundoeducacao.uol.com.br/vestibular/conteudo/img/2014/06/questao-1.jpg');

-- 3
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'O Paquistão não aparece entre os 5 mais populosos em 2000 (menos de 170 mi), mas em 2050 aparece com 344 milhões, crescimento superior a 100%.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 3, '2',
'Nos últimos anos, ocorreu redução gradativa da taxa de crescimento populacional em quase todos os continentes. A seguir, são apresentados dados relativos aos países mais populosos em 2000 e também as projeções para 2050.

Com base nas informações acima, é correto afirmar que, no período de 2000 a 2050:
A) a taxa de crescimento populacional da China será negativa.
B) a população do Brasil duplicará.
C) a taxa de crescimento da população da Indonésia será menor que a dos EUA.
D) a população do Paquistão crescerá mais de 100%.
E) a China será o país com a maior taxa de crescimento populacional do mundo.',
'https://vestibular.brasilescola.uol.com.br/enem/graficos-tabelas-no-enem.htm',
1,
'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTjmTw8FOm-HAlDLUJUTCTVg0pW_ERJxosmUTUnoKDtao26Q2lZ');

-- 4
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('A', 'Taxa fixa 17 + variável (3,60 * 14) = R$ 67,40.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 4, '3',
'Uma fatura mensal de água é composta por uma taxa fixa, independentemente do gasto, mais uma parte relativa ao consumo de água, em metro cúbico. O gráfico relaciona o valor da fatura com o volume de água gasto em uma residência no mês de novembro, representando uma semirreta.

Observa-se que, nesse mês, houve um consumo de 7 m³ de água. Sabe-se que, em dezembro, o consumo de água nessa residência, em metro cúbico, dobrou em relação ao mês anterior. O valor da fatura referente ao consumo no mês de dezembro nessa residência foi
A) superior a R$ 65,00 e inferior a R$ 70,00.
B) superior a R$ 80,00 e inferior a R$ 85,00.
C) superior a R$ 90,00 e inferior a R$ 95,00.
D) superior a R$ 95,00.
E) inferior a R$ 55,00.',
'https://app.soexercicios.com.br/plataforma/questoes-de-vestibular/ENEM/5763425/',
1,
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaf7fpfIBUTgajN9_OG7_3gRUL9ZUuWD7xbxyOVQIykXrfCeyt');

-- 5
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Eficiência = Peças/Horas. Dia 3: 1100/5 = 220 (maior valor).');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 5, '2',
'Os gráficos representam a produção de peças em uma indústria e as horas trabalhadas dos funcionários no período de cinco dias. Em cada dia, o gerente de produção aplica uma metodologia diferente de trabalho. Seu objetivo é avaliar a metodologia mais eficiente para utilizá-la como padrão nos próximos períodos. Sabe-se que, neste caso, quanto maior for a razão entre o número de peças produzidas e o número de horas trabalhadas, maior será a eficiência da metodologia.

Em qual dia foi aplicada a metodologia mais eficiente?
A) 1
B) 2
C) 3
D) 4
E) 5',
'http://projetoagathaedu.com.br/questoes-enem/resolucao-matematica/interpretacao-de-graficos.php',
1,
'https://www.projetoagathaedu.com.br/imagens/provas-enem/matematica-pos/2020/em-qual-dia-foi-aplicada-metodologia-mais-eficiente-b.webp');

-- 6
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Média = (250+208+215+251+187+187+186)/7 = 1484/7 = 212. O valor mais próximo é quarta-feira (251).');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 6, '1',
'O quadro apresenta a quantidade de um tipo de pão vendido em uma semana em uma padaria. O dono da padaria decidiu que, na semana seguinte, a produção diária desse tipo de pão seria igual ao número de pães vendidos no dia da semana em que tal quantidade foi a mais próxima da média das quantidades vendidas na semana.

O dia da semana utilizado como referência para a quantidade de pães a serem produzidos diariamente foi
A) domingo.
B) segunda-feira.
C) terça-feira.
D) quarta-feira.
E) sábado.',
'https://xequematenem.com.br/blog/questao-179-enem-ppl-2019/',
10,
'https://xequematenem.com.br/blog/wp-content/webp-express/webp-images/uploads/2024/06/image-67.png.webp');

-- 7
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Lista 5,5,5,7,7,9: mediana = (5+7)/2 = 6; média = 38/6 ≈ 6,33. Média > mediana.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 7, '1',
'Cada uma das cinco listas dadas é a relação de notas obtidas por seis alunos de uma turma em uma certa prova. Assinale a única lista na qual a média das notas é maior do que a mediana.
A) 5, 5, 7, 8, 9, 10
B) 4, 5, 6, 7, 8, 8
C) 4, 5, 6, 7, 8, 9
D) 5, 5, 5, 7, 7, 9
E) 5, 5, 10, 10, 10, 10',
'http://educacao.globo.com/provas/fuvest-2014/questoes/42.html',
13,
NULL);

-- 8
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'Média = (0·52 + 1·5 + 2·2 + 3·1)/(52+5+2+1) = 12/60 = 0,2.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 8, '2',
'Em uma fábrica de refrigerantes, é necessário que se faça periodicamente o controle no processo de engarrafamento para evitar que sejam envasadas garrafas fora da especificação do volume escrito no rótulo. Diariamente, durante 60 dias, foram anotadas as quantidades de garrafas fora dessas especificações. O resultado está apresentado no quadro.

A média diária de garrafas fora das especificações no período considerado é
A) 0,1.
B) 0,2.
C) 1,5.
D) 2,0.
E) 3,0.',
'https://download.inep.gov.br/educacao_basica/enem/provas/2019/',
13,
'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR5LKdOsXPOgJzmbCVC6g7dYp6tgrLVXLWbJOfOFK7culAiuAJ7');

-- 9
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'Dados ordenados; termos centrais 7,9 e 8,1; mediana = (7,9+8,1)/2 = 8,0%.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 9, '3',
'O gráfico apresenta a taxa de desemprego (em %) para o período de março de 2008 a abril de 2009, obtida com base nos dados observados nas regiões metropolitanas de Recife, Salvador, Belo Horizonte, Rio de Janeiro, São Paulo e Porto Alegre.

A mediana dessa taxa de desemprego, no período de março de 2008 a abril de 2009, foi de:
A) 8,1%.
B) 8,0%.
C) 7,9%.
D) 7,7%.
E) 7,6%.',
'https://plataformaassaad.com.br/questao-174-caderno-azul-do-enem-2017-dia-2/',
11,
'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRGYcw1WQlmQP-sRAOWVaPXhUOrGjhMZNtflxv3BUU6lWmUycFV');

-- 10
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'O gráfico B reflete a relação: quando o índice 1 aumenta, o índice 2 diminui; mediana e média iguais.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(1, 10, '2',
'Considere as informações do gráfico. Com base nas informações apresentadas no gráfico, é correto afirmar que:
A) apenas a mediana e a moda da variável são iguais.
B) apenas a mediana e média da variável são iguais.
C) apenas a média e a moda da variável são iguais.
D) a média, a moda e a mediana da variável são iguais.
E) a média, a moda e a mediana das variáveis são diferentes.',
'https://www.qconcursos.com/questoes-de-concursos/questoes/2b7cbed6-e2',
4,
'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTGXwkNYOuGuMgCzHKvKAcSDqx1dghipAqpAuVFCbu1D9D1tsuw');

-- 11
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'MA = 343/7 = 49; DP = √(70/7) = √10 ≈ 3,16 → variabilidade baixa.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 11, '1',
'Um fiscal de certa empresa de ônibus registra o tempo, em minuto, que um motorista novato gasta para completar certo percurso. No Quadro 1 figuram os tempos gastos pelo motorista ao realizar o mesmo percurso sete vezes. O Quadro 2 apresenta uma classificação para a variabilidade do tempo, segundo o valor do desvio padrão.

Com base nas informações apresentadas nos quadros, a variabilidade do tempo é
A) extremamente baixa.
B) baixa.
C) moderada.
D) alta.
E) extremamente alta.',
'https://www.todamateria.com.br/estatistica-exercicios/',
3,
'https://static.todamateria.com.br/upload/im/ag/imagem3-38.jpg');

-- 12
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('E', 'CV atual = 1/10 = 0,1. Nova ração: 1,5/x̄ < 0,1 → x̄ > 15. Resposta: 15,0.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 12, '2',
'Um zootecnista pretende testar se uma nova ração para coelhos é mais eficiente do que a que ele vem utilizando atualmente. A ração atual proporciona uma massa média de 10 kg por coelho, com um desvio padrão de 1 kg. O zootecnista selecionou uma amostra e obteve desvio padrão de 1,5 kg.

A substituição da ração ocorrerá se a média da distribuição das massas dos coelhos da amostra, em quilograma, for superior a
A) 5,0
B) 9,5
C) 10,0
D) 10,5
E) 15,0',
'https://www.todamateria.com.br/estatistica-exercicios/',
13,
NULL);

-- 13
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Mais regular = menor DP (atleta III, 4,08). Menos regular = maior DP (atleta II, 8,49). Luta: II e III.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 13, '2',
'O procedimento de perda rápida de "peso" é comum entre os atletas dos esportes de combate. Para participar de um torneio, quatro atletas da categoria até 66kg foram submetidos a dietas e atividades físicas. Realizaram três "pesagens" antes do início do torneio. Pelo regulamento, a primeira luta deverá ocorrer entre o atleta mais regular e o menos regular quanto aos "pesos".

A primeira luta foi entre os atletas
A) I e III.
B) I e IV.
C) II e III.
D) II e IV.
E) III e IV.',
'https://www.todamateria.com.br/estatistica-exercicios/',
3,
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm67rnyYXtIFjAgVNTXUOKzGCUAEe2nYtAna39njdxF74pQ0pH');

-- 14
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('E', 'DP = 90 kg/talhão; talhão 3 ha → 30 kg/ha = 0,5 saca/ha; variância = 0,25.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 14, '2',
'Um produtor de café irrigado em Minas Gerais recebeu um relatório de consultoria estatística com desvio padrão das produções de 90 kg/talhão (área 30.000 m²). A variância das produções dos talhões expressa em (sacas/hectare)² é:
A) 20,25
B) 4,50
C) 0,71
D) 0,50
E) 0,25.',
'https://www.todamateria.com.br/estatistica-exercicios/',
8,
NULL);

-- 15
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Mesma média; DP de B (5) > DP de A (2) → B mais disperso.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 15, '3',
'Dois conjuntos de dados possuem a mesma média. O conjunto A tem desvio padrão 2 e o conjunto B tem desvio padrão 5. Pode-se afirmar que:
A) Os dados de A são mais dispersos que os de B
B) Os dados de B são mais homogêneos que os de A
C) Os dados de B são mais dispersos que os de A
D) Ambos têm a mesma variabilidade
E) Não é possível comparar',
'https://www.todamateria.com.br/estatistica-exercicios/',
4,
NULL);

-- 16
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Arrecadação: I=26, II=17, III=28,5, IV=29, V=25,6. Maior: tipo IV.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 16, '1',
'O gerente de uma loja de cosméticos colocou à venda cinco diferentes tipos de perfume. O setor de controle de estoque encaminhou registros gráficos descrevendo os preços unitários e a quantidade vendida (percentual) no mês de novembro.

Qual o tipo de perfume que deverá ter maior reposição no estoque?
A) I
B) II
C) III
D) IV
E) V',
'https://plataformaassaad.com.br/questao-156-caderno-azul-do-enem-2020/',
1,
'https://plataformaassaad.com.br/wp-content/webp-express/webp-images/uploads/2025/01/image-371.png.webp');

-- 17
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'De 2013 a 2015: 67→59 (−8% em 2 anos → −4%/ano). 2014 ≈ 63,0%.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 17, '2',
'A raiva é uma doença viral e infecciosa. O gráfico mostra a cobertura da campanha de vacinação antirrábica em cães nos anos de 2013, 2015 e 2017 em Belo Horizonte. A variação deu-se de forma linear.

Qual teria sido a cobertura dessa campanha no ano de 2014?
A) 62,3%
B) 63,0%
C) 63,5%
D) 64,0%
E) 65,5%',
'https://plataformaassaad.com.br/questao-168-caderno-azul-do-enem-2018/',
9,
'https://plataformaassaad.com.br/wp-content/webp-express/webp-images/uploads/2025/02/Captura-de-tela-2025-02-06-175529-19.png.webp');

-- 18
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('E', 'Diferença entre as razões da altura da coluna B pela coluna A nos gráficos 1 e 2 = 8/35.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 18, '2',
'O resultado de uma pesquisa eleitoral foi representado pelo Gráfico 1. Ao ser divulgado, o Gráfico 1 foi cortado na diagramação (Gráfico 2). Muitos leitores criticaram o formato do Gráfico 2.

A diferença entre as razões da altura da coluna B pela coluna A nos gráficos 1 e 2 é
A) 0
B) 1/2
C) 1/5
D) 2/15
E) 8/35',
'https://plataformaassaad.com.br/questao-165-caderno-azul-do-enem-2017-dia-2/',
1,
NULL);

-- 19
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('B', 'Média mensal = 120/5 = 24. 12×24 = 288. Já usadas 108. Adquirir 288−108 = 180.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 19, '2',
'Um posto de saúde registrou vacinas contra febre amarela nos últimos cinco meses: 21, 22, 25, 31, 21. No início tinha 228 em estoque. A reposição no 6º mês deve deixar o estoque igual a 12 vezes a média dos 5 meses.

A quantidade de vacinas que o posto deve adquirir no início do sexto mês é
A) 156
B) 180
C) 192
D) 264
E) 288',
'https://plataformaassaad.com.br/questao-159-caderno-azul-enem-2016/',
5,
NULL);

-- 20
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Soma atual 28,95; após substituições e +2,02 → 23,67; falta 6,18 para média 1,99 → média dos 3 = 2,06.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 20, '1',
'O técnico de um time de basquete pretende aumentar a estatura média de 1,93 m para no mínimo 1,99 m. Substituirá os quatro mais baixos (1,78; 1,82; 1,84; 1,86) e já contratou um de 2,02 m.

Qual deverá ser a média mínima das estaturas (m) dos três novos jogadores que ainda contratará?
A) 1,96
B) 1,98
C) 2,05
D) 2,06
E) 2,08',
'https://plataformaassaad.com.br/questao-165-caderno-azul-do-enem-2020/',
10,
'http://s2-educacao.glbimg.com/1kWF4efhvmD9DdAp6Ndh7VE9s5c=/0x0:377x138/300x110/s.glbimg.com/po/ek/f/original/2013/12/12/prova_enem_-_questao_174_1.png');

-- 21
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Todas com média 45. Menor DP = Equipe III (1) → campeã.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 21, '1',
'Em uma corrida de regularidade, a equipe campeã é aquela em que o tempo dos participantes mais se aproxima do tempo fornecido (média 45 min). Utilizando os dados estatísticos do quadro, a campeã foi a equipe
A) I
B) II
C) III
D) IV
E) V',
'https://plataformaassaad.com.br/questao-158-caderno-azul-enem-2010-ppl/',
11,
NULL);

-- 22
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Condicionada a calçado > 36: casos favoráveis 38 → probabilidade 5/7 (conforme quadro da questão).');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 22, '3',
'O diretor de um colégio leu numa revista que a média do tamanho dos calçados das mulheres era de 35,5 e hoje é 37,0. Fez uma pesquisa com as funcionárias.

Escolhendo uma funcionária ao acaso e sabendo que ela tem calçado maior que 36,0, a probabilidade de ela calçar 38,0 é
A) 1/3
B) 1/5
C) 2/5
D) 5/7
E) 5/14',
'http://educacao.globo.com/provas/enem-2010/questoes/174.html',
3,
NULL);

-- 23
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('A', 'Normal μ=73, σ=15. Nota A (15% superiores): z≈1,04 → ≈88,5. Não receber F (acima de 12%): z≈−1,18 → ≈55,4.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 23, '3',
'Suponha que as notas de uma prova sejam normalmente distribuídas com média 73 e desvio-padrão 15. 15% dos alunos mais adiantados recebem a nota A e 12% dos mais atrasados recebem a nota F.

Encontre o mínimo para receber A e o mínimo para passar (não receber F).
A) ≈88,5 e ≈55,4
B) ≈85 e ≈60
C) ≈90 e ≈50
D) ≈80 e ≈70
E) ≈95 e ≈40',
'https://professor.pucgoias.edu.br/',
7,
NULL);

-- 24
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Ordenando (8, 8, 9, 14, 16), o termo central (mediana) é 9.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 24, '1',
'Um desenvolvedor analisa a quantidade de bugs: 8, 8, 16, 9 e 14. Qual é a mediana?
A) 16
B) 8
C) 9
D) 11
E) 14',
'Questões Projeto p.48',
11,
'https://s4.static.brasilescola.uol.com.br/img/2016/11/grafico-exemplo-1.jpg');

-- 25
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Modelo A: média 10, DP≈1,58, CV≈15,8%. Modelo B: média 11, DP≈2,92, CV≈26,5%. DP e CV de A menores.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(2, 25, '2',
'Uma empresa testa dois modelos de empilhadeiras. Tempos (s):
Modelo A: 8, 10, 9, 11, 12
Modelo B: 7, 9, 12, 14, 13

Com base nos dados, pode-se concluir que:
A) O desvio padrão de A é maior que o de B, e o CV de A é menor que o de B.
B) O desvio padrão de A é menor que o de B, e o CV de A é maior que o de B.
C) O desvio padrão e o CV de A são ambos menores que os de B.
D) O desvio padrão e o CV de A são ambos maiores que os de B.
E) O desvio padrão de A é maior que o de B, e o CV de A também é maior que o de B.',
'https://www.todamateria.com.br/exercicios-de-desvio-padrao/',
3,
'https://d2q576s0wzfxtl.cloudfront.net/2023/12/04224240/177.png');

-- 26
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Paquistão em 2050 com 344 mi — mais que o dobro da população do Brasil em 2000 → crescimento > 100%.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(3, 26, '1',
'Nos últimos anos, ocorreu redução gradativa da taxa de crescimento populacional. Dados dos países mais populosos em 2000 e projeções para 2050.

Com base nas informações, no período de 2000 a 2050:
A) a taxa de crescimento populacional da China será negativa.
B) a população do Brasil duplicará.
C) a taxa de crescimento da população da Indonésia será menor que a dos EUA.
D) a população do Paquistão crescerá mais de 100%.
E) a China será o país com a maior taxa de crescimento populacional do mundo.',
'https://vestibular.brasilescola.uol.com.br/enem/graficos-tabelas-no-enem.htm',
3,
NULL);

-- 27
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('D', 'Menor cobertura de vacinação entre as categorias restantes = adultos 20–29 anos (mais expostos).');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(3, 27, '2',
'O gráfico expõe números da gripe A-H1N1. Entre as categorias em processo de imunização, a que está mais exposta ao vírus é a categoria de
A) Indígenas
B) gestantes
C) doentes crônicos
D) adultos entre 20 e 29 anos
E) crianças de 6 meses a 2 anos',
'https://descomplica.com.br/gabarito-enem/questoes/2023/',
1,
'https://d2q576s0wzfxtl.cloudfront.net/2023/12/04224240/177.png');

-- 28
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('E', 'Peso ideal 58 kg; excesso 5 kg; 5×0,67 ≈ 3,35 minutos.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(3, 28, '1',
'Usando tabela e gráfico de tempo perdido por excesso de peso, um atleta de 63 kg e 1,59 m que correu meia-maratona pode estimar que, em peso ideal, teria melhorado seu tempo em:
A) 0,32 minutos
B) 0,67 minutos
C) 1,60 minutos
D) 2,68 minutos
E) 3,35 minutos',
'https://xequematenem.com.br/blog/questao-162-enem-2021/',
9,
'https://s2.static.brasilescola.uol.com.br/exercicios/2021/10/numero-paes-vendidos-dias-semana.jpg');

-- 29
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('C', 'Média = 1484/7 = 212. Valor mais próximo: terça-feira (215).');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(3, 29, '3',
'O dono da padaria decidiu que a produção diária seria igual ao número de pães do dia em que a quantidade foi a mais próxima da média da semana.

O dia da semana utilizado como referência foi
A) domingo
B) segunda-feira
C) terça-feira
D) quarta-feira
E) sábado',
'https://exercicios.brasilescola.uol.com.br/exercicios-matematica/enem-lista-de-exercicios-sobre-estatistica-moda-media-e-mediana.htm',
2,
NULL);

-- 30
INSERT INTO resposta (resposta_correta, explicacao) VALUES
('A', 'Condição moda = mediana = média = amplitude = 23; contagem de listas válidas de 5 inteiros positivos = 8.');
INSERT INTO questao (idtopico, idresposta, nivel_de_dificuldade, enunciado, referencias, vestibular, imagem) VALUES
(3, 30, '1',
'Assinale a alternativa que representa a quantidade de listas de 5 números inteiros positivos que cumpram a condição: moda = mediana = média = amplitude = 25.
A) 8
B) 9
C) 11
D) 22
E) 44',
'https://sisq.elitecampinas.com.br/',
12,
'https://d2q576s0wzfxtl.cloudfront.net/2019/11/06121442/mat3.jpg');

