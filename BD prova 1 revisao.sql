-- (1) Liste os cursos e suas ofertas que têm data de início entre 2023-01-01 e 2023-06-30
SELECT c.id_curso, o.id_oferta, o.data_inicio,o.data_fim
FROM Curso c
JOIN oferta o ON c.id_curso = o.id_curso
WHERE o.data_inicio >= '2023-01-01' AND o.data_inicio <= '2023-06-30'

-- (2) Qual é o total de inscrições por tipo de público  alvo? 
SELECT o.publico_alvo, COUNT(i.id_inscricao) AS total_inscricao
FROM inscricao i 
JOIN oferta o ON i.id_oferta = o.id_oferta
GROUP BY o.publico_alvo
ORDER BY total_inscricao DESC;

-- (3)Quantas inscrições existem por curso?
SELECT cu.nome AS nome_curso, COUNT(i.id_inscricao) AS total_inscricao
FROM inscricao i
JOIN oferta o ON i.id_oferta = o.id_oferta
JOIN curso cu ON o.id_curso = cu.id_curso
GROUP BY cu.nome
ORDER BY total_inscricao DESC;

-- (4)Liste os 10 usuários mais recentes que se inscreveram em ofertas.
SELECT i.id_usuario 
FROM inscricao i 
ORDER BY i.data_inscricao DESC
LIMIT 10;

-- Liste os cursos que têm ofertas com inscrições de usuários que
-- nasceram entre 1980 e 2000, e calcule a média de carga horária desses cursos.
-- Além disso, ordene os resultados pela média de carga horária em
-- ordem decrescente e limite a lista aos 5 primeiros cursos.
SELECT c.nome AS nome_curso,
AVG(c.carga_horaria) AS media_carga_horaria
FROM curso c
JOIN oferta o ON c.id_curso = o.id_curso
JOIN inscricao i ON o.id_oferta = i.id_oferta
JOIN usuario u ON i.id_usuario = u.id_usuario
WHERE u.data_nascimento BETWEEN '1980' AND '2000'
GROUP BY c.nome
ORDER BY media_carga_horaria DESC
LIMIT 5;

-- 6 - Gere o CROSS JOIN das tabelas cursos e ofertas
SELECT
    c.id_curso AS curso_id,
    c.nome AS nome_curso,
    c.conteudo_programatico,
    c.carga_horaria,
    c.data_criacao AS curso_data_criacao,
    c.email_responsavel,
    o.id_oferta AS oferta_id,
    o.id_curso AS oferta_curso_id,
    o.publico_alvo,
    o.data_inicio,
    o.data_fim
FROM curso c
CROSS JOIN oferta o;


