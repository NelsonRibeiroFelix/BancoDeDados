CREATE DATABASE Eventos;
USE Eventos;

-- Tabela Organizadores
CREATE TABLE Organizadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato_email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    website VARCHAR(255)
);

-- Tabela Eventos
CREATE TABLE Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME NOT NULL,
    local VARCHAR(255),
    organizador_id INT NOT NULL,
    tipo_evento VARCHAR(50),
    FOREIGN KEY (organizador_id) REFERENCES Organizadores(id)
);

-- Tabela Participantes
CREATE TABLE Participantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_inscricao_sistema DATE NOT NULL,
    instituicao_ensino VARCHAR(100)
);

-- Tabela Inscricoes
CREATE TABLE Inscricoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    id_participante INT NOT NULL,
    data_inscricao DATETIME NOT NULL,
    status_pagamento VARCHAR(50) NOT NULL,
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id),
    FOREIGN KEY (id_participante) REFERENCES Participantes(id),
    UNIQUE (id_evento, id_participante) 
);
-- Inserindo dados na tabela Organizadores
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Camargo da Conceição - ME', 'sofia73@santos.com', '+55 (021) 3945-3188', 'https://www.rios.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Costela', 'eloa36@machado.org', '41 5659-9763', 'http://www.castro.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Dias - ME', 'davi-lucas54@correia.br', '84 2386 6950', 'http://novais.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Gomes', 'rodrigofernandes@albuquerque.br', '(031) 8761 9708', 'https://www.abreu.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Costa', 'cavalcantimaria@costela.com', '(011) 9262-1371', 'http://da.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('da Costa', 'cmendonca@nascimento.com', '(031) 0556-5670', 'https://www.cassiano.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('da Costa', 'tcostela@martins.br', '(061) 6562-4126', 'https://www.carvalho.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('da Paz', 'tporto@freitas.com', '(071) 7973 2744', 'https://www.moura.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Pinto', 'uporto@camargo.com', '+55 84 8110-1804', 'http://da.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Leão', 'jademendonca@da.br', '(081) 3595 1767', 'http://www.costa.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Souza', 'pereirahellena@abreu.com', '+55 11 9314 1502', 'http://costa.net/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Cavalcanti', 'dcamargo@moura.com', '61 5014-4189', 'https://www.mendonca.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Fonseca Moura - ME', 'brayan05@almeida.org', '(061) 8306-2989', 'http://oliveira.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Cunha - ME', 'pintoisaque@correia.org', '71 1286-1342', 'http://farias.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Campos e Filhos', 'eduardarocha@teixeira.com', '+55 (061) 7509 8770', 'https://sousa.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Oliveira', 'theo75@mendes.net', '+55 (051) 9368-7698', 'https://fernandes.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Abreu', 'esterpires@borges.org', '+55 31 7505 8961', 'http://www.leao.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Garcia', 'kmontenegro@vieira.net', '0300-782-9893', 'https://caldeira.net/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('da Costa - ME', 'thales49@duarte.br', '(081) 4025 9587', 'http://albuquerque.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Pinto S/A', 'nvieira@vieira.br', '(041) 4230-4908', 'https://www.da.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Cavalcante', 'sofia26@lima.org', '+55 (071) 8499 3879', 'https://mendonca.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Azevedo', 'gustavocosta@da.com', '(084) 3833 8548', 'https://www.sampaio.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Melo', 'camargoluiz-otavio@teixeira.net', '(011) 2705-9193', 'https://pimenta.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Melo', 'ribeirojulia@garcia.net', '+55 (041) 4565 3290', 'http://www.sa.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Monteiro', 'pereiradiego@gomes.net', '0900-569-7445', 'http://www.da.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Carvalho', 'hda-mata@aparecida.org', '0800-771-8596', 'http://www.da.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Camargo Araújo Ltda.', 'clarada-paz@novaes.br', '(081) 8935 1874', 'https://www.mendonca.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('da Mata e Filhos', 'davi07@fogaca.br', '+55 (051) 5723-5705', 'https://www.alves.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Macedo S/A', 'leandro11@albuquerque.br', '41 7570 2609', 'https://www.cirino.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Santos', 'pereiragiovanna@caldeira.net', '41 5618-6634', 'https://cavalcante.net/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Sales', 'caueferreira@peixoto.org', '+55 31 7442 7530', 'https://www.da.net/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Aragão da Rosa Ltda.', 'nfogaca@camara.net', '+55 (011) 3477 8798', 'http://www.da.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Pacheco', 'egarcia@sousa.org', '+55 71 3263-3993', 'http://www.sampaio.net/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Teixeira - ME', 'ana-vitoria74@da.com', '+55 (071) 5796 3369', 'https://aragao.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Pacheco', 'ffogaca@da.br', '(051) 5430-7388', 'http://da.org/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Novaes', 'eduardoramos@cardoso.br', '+55 51 0990 5137', 'http://www.novaes.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Aparecida', 'emanuella79@pacheco.com', '71 7624 4971', 'https://nascimento.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Moura S.A.', 'leticia65@pastor.br', '+55 (021) 6211 3135', 'http://pacheco.com/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Brito', 'emanuellaramos@cirino.com', '+55 (031) 1454 4731', 'http://www.azevedo.br/');
INSERT INTO Organizadores (nome, contato_email, telefone, website) VALUES ('Souza das Neves e Filhos', 'benicio24@silva.org', '+55 84 6845 5076', 'https://barros.net/');

-- Inserindo dados na tabela Participantes
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Heitor das Neves', 'yuri41@example.org', '+55 84 1200-6340', '2025-04-26', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Alícia Silveira', 'tmelo@example.com', '+55 (051) 3772 8686', '2024-10-09', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Maria Luiza Moraes', 'daniela66@example.org', '51 1227 4842', '2024-07-17', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Helena Teixeira', 'saliz@example.org', '(081) 7819-2594', '2025-04-19', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Theo Ferreira', 'caldeiravitoria@example.com', '+55 21 1969-2163', '2023-08-22', 'Cirino Pacheco - ME Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Hellena Sá', 'egoncalves@example.org', '+55 61 1378-4647', '2024-10-02', 'Fernandes Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Yago Duarte', 'auroraaparecida@example.net', '(081) 9906-2683', '2024-07-12', 'Campos e Filhos Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Luara Farias', 'britoravi@example.com', '(051) 9841-3102', '2024-01-20', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Catarina Campos', 'umartins@example.org', '61 1341-8955', '2024-05-18', 'Cardoso e Filhos Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Calebe Rios', 'gabrielamoraes@example.net', '+55 (031) 8442 8016', '2023-09-09', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Anthony Carvalho', 'noahborges@example.org', '+55 (021) 0493-2832', '2025-04-01', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('João Vitor Ribeiro', 'manuella20@example.net', '84 1935 8535', '2023-07-03', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Heloísa Nascimento', 'hadassapacheco@example.com', '+55 (051) 5369 9435', '2024-02-08', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Mariah Pacheco', 'yago01@example.org', '+55 (041) 4404 0594', '2024-01-09', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Alexandre Moreira', 'da-rosastella@example.org', '+55 (011) 5973-4633', '2023-10-26', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Diogo Moraes', 'joao-guilhermecardoso@example.org', '+55 21 9733-0722', '2024-09-18', 'da Cruz Sá e Filhos Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Aylla Leão', 'wda-rosa@example.com', '+55 31 6190-1409', '2023-10-19', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Thiago da Paz', 'costelaesther@example.net', '+55 (084) 7017 8853', '2025-04-06', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Vitor Gabriel Rios', 'joao50@example.org', '+55 (081) 0997 1149', '2024-10-02', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Maria Laura Rodrigues', 'liam46@example.net', '+55 41 8990-3796', '2023-05-09', 'Melo S.A. Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Nina Sampaio', 'jsiqueira@example.com', '81 4439-7753', '2023-11-06', 'Nascimento Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Breno da Cruz', 'vitor53@example.net', '(081) 4088 7282', '2024-11-27', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Mariah da Luz', 'eduardo62@example.com', '31 0080 4336', '2024-01-01', 'Carvalho Nascimento Ltda. Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Maria Cecília Ribeiro', 'castromelina@example.com', '+55 81 8749-4028', '2024-11-12', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Luiz Fernando Pimenta', 'alice89@example.net', '+55 31 1345 5836', '2024-02-08', 'Cavalcanti Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Diego Martins', 'ssilva@example.com', '71 6168 7891', '2024-05-20', 'Vargas Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Calebe Camargo', 'joana19@example.com', '81 4782-1684', '2024-03-10', 'Correia Fernandes Ltda. Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Emanuelly Almeida', 'viniciusmacedo@example.net', '+55 81 1384-8200', '2023-11-25', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Beatriz Cavalcanti', 'nunesmaria-liz@example.net', '+55 11 4899 7812', '2024-08-31', 'Sampaio Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Lorena Abreu', 'marquesana-clara@example.com', '11 3709 1481', '2024-05-12', 'Fogaça Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Ian da Mota', 'liz33@example.net', '(051) 0139 5389', '2024-03-01', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Yasmin Duarte', 'gabrielly30@example.com', '+55 41 8897 1277', '2024-03-09', 'Moraes Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Maya Sousa', 'joao-vitorfonseca@example.net', '61 1266 0212', '2023-10-04', 'Casa Grande Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Pietro Viana', 'gvasconcelos@example.org', '(021) 0332-2348', '2024-09-01', 'das Neves Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Vitor Gabriel Lopes', 'marcela02@example.net', '+55 41 6946 0500', '2024-11-26', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Renan Lopes', 'xnunes@example.com', '+55 21 0420 3347', '2023-07-07', 'Aparecida Ltda. Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Mariana Castro', 'agatha82@example.com', '+55 51 0562 4234', '2023-09-20', 'Cunha Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Emanuel Araújo', 'yagoalmeida@example.org', '51 7244 7647', '2023-09-28', NULL);
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Arthur Gabriel Machado', 'jesusvalentina@example.org', '(084) 0410 3073', '2023-08-01', 'Camargo Escola');
INSERT INTO Participantes (nome, email, telefone, data_inscricao_sistema, instituicao_ensino) VALUES ('Apollo Moraes', 'gfonseca@example.net', '+55 (011) 1541 5048', '2023-05-18', NULL);

-- Inserindo dados na tabela Eventos
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Conferência Prático de Finanças Pessoais', 'Explore técnicas avançadas e estudos de caso reais sobre Finanças Pessoais com especialistas da área. Vel delectus beatae assumenda.', '2026-03-18 01:00:35', '2026-03-19 09:00:35', 'Viela de Fogaça, 57
São Damião
87698-944 Mendonça do Norte / MS', 35, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('O Futuro do Recursos Humanos', 'Descubra as últimas novidades e tendências que moldarão o futuro do Recursos Humanos no próximo ano. Corrupti earum minima ad.', '2026-04-21 19:30:35', '2026-04-22 01:30:35', 'Residencial de da Cruz, 7
Bairro Das Indústrias Ii
48849674 Moura de Minas / PA', 17, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Finanças Pessoais para 2025', 'Veja como aplicar Finanças Pessoais no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Culpa ipsa tenetur laborum eveniet.', '2026-02-04 02:00:35', '2026-02-06 05:00:35', 'Passarela Rodrigo Oliveira
Petropolis
67292-014 Lima / PR', 34, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Vendas na Prática', 'Um palestra ideal para quem está começando a explorar o universo de Vendas. Excepturi sint nesciunt dignissimos.', '2026-03-28 01:00:35', '2026-03-30 06:00:35', 'Viaduto Arthur Novaes, 4
Ipiranga
86112923 Borges / TO', 20, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Desenvolvimento Web na Prática', 'Aprenda os fundamentos e conceitos essenciais de Desenvolvimento Web neste meetup interativo. Eum laborum iste voluptatum sequi dicta sapiente consectetur.', '2025-09-06 02:30:35', '2025-09-08 05:30:35', 'Recanto de Barros
Tupi A
52966-120 Azevedo de Goiás / BA', 14, 'Meetup');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Sustentabilidade para Iniciantes', 'Descubra as últimas novidades e tendências que moldarão o futuro do Sustentabilidade no próximo ano. Amet quae sint sunt.', '2026-03-15 00:30:35', '2026-03-15 05:30:35', 'Sítio Ana Vitória Pinto
Bela Vitoria
55625-247 Mendonça / PR', 33, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Cloud Computing para 2026', 'Uma visão aprofundada sobre as inovações e o futuro promissor de Cloud Computing. Facere quod dolorem est magnam quaerat provident.', '2026-04-07 22:30:35', '2026-04-09 00:30:35', 'Viela de Aparecida, 620
Gameleira
87218727 da Mata / MT', 5, 'Meetup');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Workshop Avançado de Recursos Humanos', 'Aprenda os fundamentos e conceitos essenciais de Recursos Humanos neste workshop interativo. Quos earum deleniti architecto porro repellat.', '2025-11-17 21:30:35', '2025-11-20 02:30:35', 'Travessa Sampaio, 919
Vila São Geraldo
91840-402 Vieira / SP', 11, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Culinária na Prática', 'Descubra as últimas novidades e tendências que moldarão o futuro do Culinária no próximo ano. Repellendus saepe suscipit blanditiis hic.', '2025-11-10 01:30:35', '2025-11-10 04:30:35', 'Morro Lorena Andrade, 53
Vila Jardim Alvorada
08645178 Rezende das Pedras / PA', 19, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Design Gráfico para Iniciantes', 'Veja como aplicar Design Gráfico no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Numquam aperiam consequuntur odio placeat.', '2025-09-28 01:30:35', '2025-09-29 04:30:35', 'Largo Henry Gabriel Rocha, 570
Vila Nova Paraíso
47497-714 da Conceição do Galho / PI', 8, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Introdução a Inovação', 'Participe de atividades práticas e aplique seus conhecimentos em Inovação em cenários reais. Cum molestiae fugit eos nobis.', '2026-03-07 01:00:35', '2026-03-08 07:00:35', 'Colônia Farias, 47
Floramar
01023-528 Rocha / PI', 32, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Curso Avançado de Design Gráfico', 'Conheça as melhores práticas e estratégias comprovadas para obter sucesso com Design Gráfico. Sint ipsa hic ea.', '2025-07-16 18:30:35', '2025-07-18 01:30:35', 'Vale de Martins, 28
Vila São Gabriel
50592-547 Cavalcante Grande / RN', 20, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Conferência Prático de Vendas', 'Explore técnicas avançadas e estudos de caso reais sobre Vendas com especialistas da área. Impedit ipsum deleniti.', '2025-12-12 20:00:35', '2025-12-13 02:00:35', 'Residencial Valentim Brito, 49
Jardim Vitoria
62525033 Cirino das Pedras / RJ', 11, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Curso Avançado de Empreendedorismo', 'Veja como aplicar Empreendedorismo no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Neque doloribus itaque eum.', '2025-11-06 23:00:35', '2025-11-07 03:00:35', 'Trecho Thiago Nogueira, 417
Chácara Leonina
14504961 Sá / MS', 26, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Workshop Avançado de Marketing Digital', 'Desenvolva habilidades práticas e domine as ferramentas mais importantes de Marketing Digital. Vitae dolore dolorem officia natus nihil expedita.', '2026-01-13 18:00:35', '2026-01-15 00:00:35', 'Chácara Luara Martins, 96
Manacas
68926377 Silveira Paulista / RN', 24, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Inteligência Artificial para 2026', 'Veja como aplicar Inteligência Artificial no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Assumenda aperiam minima tenetur odit ipsam error odio.', '2025-10-21 19:30:35', '2025-10-24 02:30:35', 'Rodovia Aragão, 592
Vila União
65195-350 Cirino da Prata / PB', 34, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Programação Mobile para 2025', 'Veja como aplicar Programação Mobile no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Possimus accusamus aspernatur maiores beatae dolores laborum.', '2026-01-29 00:30:35', '2026-01-31 08:30:35', 'Estação Luigi Camargo, 70
Nova Pampulha
86130-395 Dias de Goiás / DF', 10, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Seminário Avançado de Inovação', 'Desenvolva habilidades práticas e domine as ferramentas mais importantes de Inovação. Optio corrupti quod.', '2025-11-01 02:30:35', '2025-11-02 04:30:35', 'Residencial Castro, 2
Horto
26562283 Nascimento de Aparecida / PB', 22, 'Seminário');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Curso Avançado de Segurança da Informação', 'Um curso ideal para quem está começando a explorar o universo de Segurança da Informação. Pariatur necessitatibus occaecati minus.', '2025-10-14 00:00:35', '2025-10-16 04:00:35', 'Recanto Fogaça, 34
Cinquentenário
11341-757 Montenegro Alegre / RJ', 37, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Sustentabilidade para 2026', 'Participe de atividades práticas e aplique seus conhecimentos em Sustentabilidade em cenários reais. Cumque corporis officiis.', '2026-01-30 00:30:35', '2026-01-31 06:30:35', 'Distrito de Sampaio, 9
Ernesto Nascimento
63671-509 Mendes da Prata / RS', 25, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Desenvolvimento Web na Prática', 'Explore técnicas avançadas e estudos de caso reais sobre Desenvolvimento Web com especialistas da área. Deleniti aliquam fuga voluptatum sunt omnis nobis totam.', '2025-09-16 18:00:35', '2025-09-18 01:00:35', 'Estação Abreu, 7
São Pedro
25928-356 Pires / PE', 18, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Inteligência Artificial para 2025', 'Participe de atividades práticas e aplique seus conhecimentos em Inteligência Artificial em cenários reais. Voluptatum non consectetur minima.', '2025-05-15 19:00:35', '2025-05-17 01:00:35', 'Trecho de Almeida, 39
Cidade Jardim
92191-952 Pimenta do Oeste / RN', 11, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Dominando Recursos Humanos', 'Veja como aplicar Recursos Humanos no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. A voluptas amet saepe.', '2025-12-19 23:30:35', '2025-12-20 06:30:35', 'Condomínio de Vasconcelos, 53
Pedreira Padro Lopes
23864-283 Fernandes da Serra / RS', 29, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Meetup Prático de Cloud Computing', 'Veja como aplicar Cloud Computing no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Quidem illum minus ab nulla.', '2025-07-03 00:30:35', '2025-07-03 06:30:35', 'Área da Luz
São Sebastião
79890232 Cunha de Sales / PR', 31, 'Meetup');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Segurança da Informação para Iniciantes', 'Descubra as últimas novidades e tendências que moldarão o futuro do Segurança da Informação no próximo ano. Earum recusandae quasi.', '2025-05-08 21:00:35', '2025-05-11 04:00:35', 'Colônia Luiz Fernando Cardoso
Califórnia
31054-879 Gonçalves / RJ', 35, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Marketing Digital: Melhores Práticas', 'Uma visão aprofundada sobre as inovações e o futuro promissor de Marketing Digital. Nam deserunt dolorem optio laudantium.', '2025-07-22 23:00:35', '2025-07-23 07:00:35', 'Estação de Sousa, 71
Paulo Vi
94952-163 Pastor / MA', 8, 'Seminário');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Inteligência Artificial na Prática', 'Um seminário ideal para quem está começando a explorar o universo de Inteligência Artificial. Sunt temporibus voluptas molestias molestiae laborum.', '2025-06-20 02:00:35', '2025-06-20 06:00:35', 'Lagoa Bruno Freitas, 51
Santa Sofia
25365-787 Ribeiro / TO', 28, 'Seminário');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Dominando Empreendedorismo', 'Uma visão aprofundada sobre as inovações e o futuro promissor de Empreendedorismo. Rerum exercitationem sint error nam eaque ipsa hic.', '2025-08-25 18:30:35', '2025-08-28 02:30:35', 'Esplanada de Pimenta, 76
Vila Nova Gameleira 1ª Seção
48394496 Sousa / MA', 35, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Vendas na Prática', 'Explore técnicas avançadas e estudos de caso reais sobre Vendas com especialistas da área. Minima expedita doloribus nobis.', '2025-11-12 02:00:35', '2025-11-13 06:00:35', 'Vale João Lucas Ribeiro, 871
Funcionários
30926973 Castro do Campo / DF', 31, 'Meetup');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Cloud Computing na Prática', 'Conheça as melhores práticas e estratégias comprovadas para obter sucesso com Cloud Computing. Numquam numquam laudantium hic distinctio veritatis veritatis illo.', '2026-03-26 21:30:35', '2026-03-28 04:30:35', 'Loteamento Luana da Mata, 556
São Salvador
56213-155 Novaes de Minas / AP', 9, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Dominando Saúde e Bem-estar', 'Desenvolva habilidades práticas e domine as ferramentas mais importantes de Saúde e Bem-estar. Modi voluptate culpa exercitationem.', '2025-07-17 01:00:35', '2025-07-18 06:00:35', 'Ladeira Silveira, 51
Vila Satélite
39995-682 Freitas / PB', 13, 'Curso');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Palestra Avançado de Finanças Pessoais', 'Explore técnicas avançadas e estudos de caso reais sobre Finanças Pessoais com especialistas da área. Magni eius accusantium beatae molestiae eligendi dignissimos.', '2025-10-13 02:30:35', '2025-10-15 06:30:35', 'Colônia da Conceição, 13
Jaraguá
52723-485 Montenegro / RJ', 14, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Sustentabilidade para Iniciantes', 'Participe de atividades práticas e aplique seus conhecimentos em Sustentabilidade em cenários reais. Nisi impedit facilis asperiores.', '2026-03-12 20:00:35', '2026-03-14 04:00:35', 'Ladeira Rios
Jardim Guanabara
14798-577 Marques de Garcia / RS', 12, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Empreendedorismo na Prática', 'Aprenda os fundamentos e conceitos essenciais de Empreendedorismo neste meetup interativo. Molestias nam quos repellat optio ad libero.', '2025-07-09 18:30:35', '2025-07-10 23:30:35', 'Praça de Casa Grande, 389
Vila Da Luz
79830-969 Costela da Mata / PB', 17, 'Meetup');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Conferência Avançado de Cloud Computing', 'Aprenda os fundamentos e conceitos essenciais de Cloud Computing neste conferência interativo. Nemo magnam quas ea dolore non explicabo.', '2025-10-07 01:00:35', '2025-10-08 05:00:35', 'Setor Caldeira, 58
Carlos Prates
06822234 Alves Grande / PA', 22, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Vendas para 2026', 'Veja como aplicar Vendas no seu dia a dia ou negócio com exemplos práticos e dicas valiosas. Aperiam nesciunt repellendus.', '2025-07-03 22:00:35', '2025-07-04 04:00:35', 'Sítio Arthur Cassiano
Vila Nova Cachoeirinha 3ª Seção
25240-719 Correia / MT', 24, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Dominando Programação Mobile', 'Conheça as melhores práticas e estratégias comprovadas para obter sucesso com Programação Mobile. Amet et eaque deleniti placeat minima tempore.', '2025-08-21 18:00:35', '2025-08-22 02:00:35', 'Morro Guerra, 722
Sion
04188-784 Guerra do Galho / TO', 4, 'Workshop');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Sustentabilidade: Melhores Práticas', 'Conheça as melhores práticas e estratégias comprovadas para obter sucesso com Sustentabilidade. Laboriosam quasi reprehenderit quidem.', '2025-10-06 01:30:35', '2025-10-06 07:30:35', 'Loteamento Samuel Guerra, 24
Conjunto Novo Dom Bosco
42568-016 Teixeira do Oeste / RS', 12, 'Palestra');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Tendências em Culinária para 2025', 'Descubra as últimas novidades e tendências que moldarão o futuro do Culinária no próximo ano. Temporibus ipsa similique reiciendis iure.', '2026-02-01 22:30:35', '2026-02-03 04:30:35', 'Estação Brenda Cardoso, 3
Juliana
07840-313 Barros de Cirino / MT', 17, 'Conferência');
INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento) VALUES ('Gestão de Projetos para Iniciantes', 'Desenvolva habilidades práticas e domine as ferramentas mais importantes de Gestão de Projetos. Mollitia rerum itaque maiores.', '2025-07-05 18:30:35', '2025-07-05 20:30:35', 'Feira Vitor Hugo Rodrigues, 15
Vila Antena Montanhês
38565-983 Fogaça / ES', 1, 'Seminário');

-- Inserindo dados na tabela Inscricoes
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (19, 8, '2025-04-29 08:58:44', 'Pago', 'PIX');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (39, 7, '2025-04-29 08:58:56', 'Pago', 'Cartão de Crédito');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (9, 28, '2025-04-29 09:00:04', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (36, 13, '2025-04-29 08:56:12', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (17, 34, '2025-04-29 08:58:37', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (16, 39, '2025-04-29 08:57:49', 'Pago', 'Boleto');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (31, 22, '2025-04-29 08:54:59', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (28, 26, '2025-04-29 08:54:55', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (30, 20, '2025-04-29 08:55:03', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (11, 3, '2025-04-29 08:54:35', 'Pago', 'Cartão de Crédito');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (31, 30, '2025-04-29 08:56:42', 'Pago', 'Transferência');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (17, 11, '2025-04-29 08:54:47', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (5, 31, '2025-04-29 08:56:46', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (8, 37, '2025-04-29 08:59:47', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (20, 17, '2025-04-29 08:56:43', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (36, 9, '2025-04-29 08:59:36', 'Pago', 'Transferência');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (25, 1, '2025-04-29 08:57:29', 'Pago', 'PIX');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (20, 4, '2025-04-29 08:56:59', 'Pago', 'Transferência');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (11, 21, '2025-04-29 09:00:09', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (18, 12, '2025-04-29 08:58:59', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (26, 38, '2025-04-29 08:57:01', 'Pago', 'Boleto');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (6, 22, '2025-04-29 08:55:28', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (39, 19, '2025-04-29 08:59:52', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (34, 29, '2025-04-29 08:57:32', 'Pago', 'Cartão de Crédito');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (31, 20, '2025-04-29 08:54:45', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (35, 3, '2025-04-29 08:58:59', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (21, 21, '2025-04-29 08:58:35', 'Pago', 'Transferência');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (22, 18, '2025-04-29 08:59:56', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (40, 38, '2025-04-29 08:55:29', 'Pago', 'Cartão de Crédito');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (8, 18, '2025-04-29 08:58:32', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (24, 1, '2025-04-29 08:57:32', 'Pago', 'Cartão de Crédito');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (36, 16, '2025-04-29 08:55:04', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (40, 27, '2025-04-29 08:56:11', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (28, 38, '2025-04-29 08:55:35', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (40, 4, '2025-04-29 08:58:27', 'Pago', 'Boleto');
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (5, 25, '2025-04-29 08:56:59', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (12, 3, '2025-04-29 08:56:51', 'Pendente', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (11, 22, '2025-04-29 08:56:51', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (39, 4, '2025-04-29 09:00:06', 'Cancelado', NULL);
INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento, forma_pagamento) VALUES (16, 34, '2025-04-29 08:57:54', 'Cancelado', NULL);




