-- QUESTÃO 1
SELECT
    p.nome AS nome_participante,
    e.nome_evento,
    CASE i.status_pagamento
        WHEN 'Pago' THEN 'Pago'
        WHEN 'Pendente' THEN 'Pendente'
        WHEN 'Cancelado' THEN 'Cancelado'
        ELSE 'Desconhecido'
    END AS status_descricao
FROM
    inscricoes i
JOIN
    Participantes p ON i.id_participante = p.id
JOIN
    Eventos e ON i.id_evento = e.id;
    
    -- QUESTÃO 2
    SELECT
    nome_evento,
    data_inicio,
    data_fim,
    CASE
        WHEN data_inicio = data_fim THEN 'Evento de 1 dia'
        WHEN DATEDIFF(data_fim, data_inicio) <= 3 THEN 'Evento de Curta Duração'
        ELSE 'Evento de Longa Duração'
    END AS classificacao_evento
FROM
    Eventos;

-- QUESTÃO 3
SELECT
    nome,
    email,
    telefone,
    data_inscricao,
    CASE
        WHEN YEAR(data_inscricao) < 2024 THEN 'Veterano'
        ELSE 'Novo'
    END AS tipo_participante
FROM
    Participantes;
    
    -- QUESTÃO 4
    SELECT
    nome,
    cargo,
    CASE cargo
        WHEN 'Diretor' THEN 'Gestor Principal'
        WHEN 'Coordenador' THEN 'Coordenação'
        WHEN 'Supervisor' THEN 'Coordenação'
        ELSE 'Apoio'
    END AS funcao
FROM
    Organizadores;
    
    -- QUESTÃO 5
SELECT
    nome,
    CASE
        WHEN telefone IS NOT NULL THEN 'WhatsApp'
        WHEN telefone IS NULL AND email IS NOT NULL THEN 'E-mail'
        ELSE 'Sem contato disponível'
    END AS prioridade_contato
FROM
    Participantes;
-- QUESTÃO 6 
SELECT
    nome_evento,
    tipo_evento,
    CASE tipo_evento
        WHEN 'Campeonato' THEN 'Competição'
        WHEN 'Corrida' THEN 'Competição'
        WHEN 'Torneio' THEN 'Competição'
        WHEN 'Oficina' THEN 'Formativo'
        WHEN 'Curso' THEN 'Formativo'
        WHEN 'Palestra' THEN 'Formativo'
        ELSE 'Outro'
    END AS classificacao_tipo
FROM
    Eventos;


