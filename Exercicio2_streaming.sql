CREATE DATABASE streaming;
USE streaming;

-- Tabela de Planos de Assinatura
CREATE TABLE Planos_Assinatura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    preco_mensal DECIMAL(10,2) NOT NULL CHECK (preco_mensal >= 0),
    resolucao_maxima VARCHAR(20) NOT NULL,
    numero_telas INT NOT NULL CHECK (numero_telas > 0),
    qualidade_audio VARCHAR(20) DEFAULT 'estéreo',
    download_disponivel BOOLEAN DEFAULT FALSE,
    UNIQUE (nome_plano)
);

-- Tabela de Conteúdos
CREATE TABLE Conteudos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM('filme', 'série', 'documentário', 'animação', 'reality show') NOT NULL,
    genero VARCHAR(50) NOT NULL,
    ano_lancamento INT NOT NULL CHECK (ano_lancamento > 1900),
    duracao_minutos INT NOT NULL CHECK (duracao_minutos > 0),
    classificacao_etaria VARCHAR(10) NOT NULL,
    status_disponibilidade BOOLEAN DEFAULT TRUE,
    idioma_original VARCHAR(50) DEFAULT 'Inglês',
    diretor VARCHAR(100),
    CHECK (classificacao_etaria IN ('L', '10', '12', '14', '16', '18'))
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    plano_assinatura_id INT NOT NULL,
    idioma_preferido VARCHAR(50) DEFAULT 'Português',
    metodo_pagamento ENUM('cartão', 'paypal', 'boleto', 'pix') DEFAULT 'cartão',
    FOREIGN KEY (plano_assinatura_id) REFERENCES Planos_Assinatura(id)
);

-- Tabela de Histórico de Visualização
CREATE TABLE Historico_Visualizacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_conteudo INT NOT NULL,
    data_visualizacao DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    progresso_percentual DECIMAL(5,2) NOT NULL CHECK (progresso_percentual >= 0 AND progresso_percentual <= 100),
    dispositivo VARCHAR(50) NOT NULL,
    tempo_assistido_min INT NOT NULL CHECK (tempo_assistido_min >= 0),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_conteudo) REFERENCES Conteudos(id),
    UNIQUE (id_usuario, id_conteudo, data_visualizacao)
);

-- Tabela de Avaliações
CREATE TABLE Avaliacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_conteudo INT NOT NULL,
    nota DECIMAL(2,1) NOT NULL CHECK (nota >= 0 AND nota <= 5),
    comentario TEXT,
    data_avaliacao DATE NOT NULL DEFAULT (CURRENT_DATE),
    util_count INT DEFAULT 0 CHECK (util_count >= 0),
    spoiler BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_conteudo) REFERENCES Conteudos(id),
    UNIQUE (id_usuario, id_conteudo)
);

-- Inserindo planos de assinatura
INSERT INTO Planos_Assinatura (nome_plano, preco_mensal, resolucao_maxima, numero_telas, qualidade_audio, download_disponivel) VALUES
('Básico', 19.90, 'HD', 1, 'estéreo', FALSE),
('Padrão', 29.90, 'Full HD', 2, 'estéreo', TRUE),
('Premium', 39.90, '4K', 4, 'Dolby Atmos', TRUE),
('Família', 49.90, '4K', 6, 'Dolby Atmos', TRUE);

-- Inserindo conteúdos
INSERT INTO Conteudos (titulo, tipo, genero, ano_lancamento, duracao_minutos, classificacao_etaria, status_disponibilidade, idioma_original, diretor) VALUES
('Stranger Things', 'série', 'Ficção científica', 2016, 50, '16', TRUE, 'Inglês', 'Duffer Brothers'),
('The Crown', 'série', 'Drama histórico', 2016, 60, '14', TRUE, 'Inglês', 'Peter Morgan'),
('Breaking Bad', 'série', 'Drama', 2008, 45, '18', TRUE, 'Inglês', 'Vince Gilligan'),
('O Irlandês', 'filme', 'Drama', 2019, 209, '16', TRUE, 'Inglês', 'Martin Scorsese'),
('Bird Box', 'filme', 'Suspense', 2018, 124, '16', TRUE, 'Inglês', 'Susanne Bier'),
('Our Planet', 'documentário', 'Natureza', 2019, 50, 'L', TRUE, 'Inglês', 'Alastair Fothergill'),
('Bohemian Rhapsody', 'filme', 'Biografia', 2018, 134, '12', TRUE, 'Inglês', 'Bryan Singer'),
('La Casa de Papel', 'série', 'Ação', 2017, 50, '16', TRUE, 'Espanhol', 'Álex Pina'),
('Dark', 'série', 'Ficção científica', 2017, 60, '16', TRUE, 'Alemão', 'Baran bo Odar'),
('The Witcher', 'série', 'Fantasia', 2019, 60, '16', TRUE, 'Inglês', 'Lauren Schmidt Hissrich'),
('Roma', 'filme', 'Drama', 2018, 135, '14', TRUE, 'Espanhol', 'Alfonso Cuarón'),
('The Social Dilemma', 'documentário', 'Documentário', 2020, 94, '12', TRUE, 'Inglês', 'Jeff Orlowski'),
('Extraction', 'filme', 'Ação', 2020, 116, '16', TRUE, 'Inglês', 'Sam Hargrave'),
('The Queen''s Gambit', 'série', 'Drama', 2020, 60, '16', TRUE, 'Inglês', 'Scott Frank'),
('Enola Holmes', 'filme', 'Mistério', 2020, 123, '12', TRUE, 'Inglês', 'Harry Bradbeer'),
('The Mandalorian', 'série', 'Ficção científica', 2019, 40, '12', TRUE, 'Inglês', 'Jon Favreau'),
('Tiger King', 'documentário', 'Crime', 2020, 50, '16', TRUE, 'Inglês', 'Eric Goode'),
('Money Heist: The Phenomenon', 'documentário', 'Documentário', 2020, 50, '16', TRUE, 'Espanhol', 'Luis Alfaro'),
('The Trial of the Chicago 7', 'filme', 'Drama', 2020, 129, '16', TRUE, 'Inglês', 'Aaron Sorkin'),
('Elite', 'série', 'Drama', 2018, 50, '18', TRUE, 'Espanhol', 'Carlos Montero'),
('Narcos', 'série', 'Drama', 2015, 50, '18', TRUE, 'Espanhol', 'Chris Brancato'),
('The Umbrella Academy', 'série', 'Super-herói', 2019, 60, '14', TRUE, 'Inglês', 'Steve Blackman'),
('To All the Boys I''ve Loved Before', 'filme', 'Romance', 2018, 99, '12', TRUE, 'Inglês', 'Susan Johnson'),
('The Kissing Booth', 'filme', 'Romance', 2018, 105, '12', TRUE, 'Inglês', 'Vince Marcello'),
('13 Reasons Why', 'série', 'Drama', 2017, 60, '18', TRUE, 'Inglês', 'Brian Yorkey'),
('Lucifer', 'série', 'Fantasia', 2016, 45, '16', TRUE, 'Inglês', 'Tom Kapinos'),
('The Good Place', 'série', 'Comédia', 2016, 22, '12', TRUE, 'Inglês', 'Michael Schur'),
('Black Mirror', 'série', 'Ficção científica', 2011, 60, '16', TRUE, 'Inglês', 'Charlie Brooker'),
('The Haunting of Hill House', 'série', 'Terror', 2018, 60, '16', TRUE, 'Inglês', 'Mike Flanagan'),
('Mindhunter', 'série', 'Crime', 2017, 60, '18', TRUE, 'Inglês', 'Joe Penhall'),
('Ozark', 'série', 'Drama', 2017, 60, '18', TRUE, 'Inglês', 'Bill Dubuque'),
('Sex Education', 'série', 'Comédia', 2019, 50, '18', TRUE, 'Inglês', 'Laurie Nunn'),
('You', 'série', 'Drama', 2018, 45, '16', TRUE, 'Inglês', 'Greg Berlanti'),
('The Platform', 'filme', 'Terror', 2019, 94, '18', TRUE, 'Espanhol', 'Galder Gaztelu-Urrutia'),
('Parasite', 'filme', 'Drama', 2019, 132, '16', TRUE, 'Coreano', 'Bong Joon-ho'),
('Uncut Gems', 'filme', 'Drama', 2019, 135, '18', TRUE, 'Inglês', 'Josh Safdie'),
('Marriage Story', 'filme', 'Drama', 2019, 137, '16', TRUE, 'Inglês', 'Noah Baumbach'),
('The Irishman', 'filme', 'Crime', 2019, 209, '18', TRUE, 'Inglês', 'Martin Scorsese'),
('Dolemite Is My Name', 'filme', 'Comédia', 2019, 118, '16', TRUE, 'Inglês', 'Craig Brewer'),
('The King', 'filme', 'Drama', 2019, 140, '16', TRUE, 'Inglês', 'David Michôd');

-- Inserindo usuários 
INSERT INTO Usuarios (nome, email, telefone, data_cadastro, plano_assinatura_id, idioma_preferido, metodo_pagamento) VALUES
('João Silva', 'joao.silva@email.com', '(11) 98765-4321', '2020-01-15', 3, 'Português', 'cartão'),
('Maria Oliveira', 'maria.oliveira@email.com', '(21) 99876-5432', '2020-02-20', 2, 'Português', 'pix'),
('Carlos Souza', 'carlos.souza@email.com', '(31) 98765-1234', '2020-03-10', 4, 'Português', 'cartão'),
('Ana Pereira', 'ana.pereira@email.com', '(41) 99876-4321', '2020-04-05', 1, 'Português', 'boleto'),
('Pedro Costa', 'pedro.costa@email.com', '(51) 98765-6789', '2020-05-12', 3, 'Português', 'cartão'),
('Mariana Santos', 'mariana.santos@email.com', '(11) 99876-9876', '2020-06-18', 2, 'Português', 'pix'),
('Lucas Martins', 'lucas.martins@email.com', '(21) 98765-3456', '2020-07-22', 1, 'Português', 'cartão'),
('Juliana Lima', 'juliana.lima@email.com', '(31) 99876-6543', '2020-08-30', 4, 'Português', 'cartão'),
('Fernando Rocha', 'fernando.rocha@email.com', '(41) 98765-8765', '2020-09-14', 3, 'Português', 'pix'),
('Patrícia Alves', 'patricia.alves@email.com', '(51) 99876-2345', '2020-10-25', 2, 'Português', 'cartão'),
('Ricardo Nunes', 'ricardo.nunes@email.com', '(11) 98765-5678', '2020-11-03', 1, 'Português', 'boleto'),
('Amanda Ferreira', 'amanda.ferreira@email.com', '(21) 99876-7890', '2020-12-10', 4, 'Português', 'cartão'),
('Bruno Carvalho', 'bruno.carvalho@email.com', '(31) 98765-9012', '2021-01-15', 3, 'Português', 'pix'),
('Cristina Gomes', 'cristina.gomes@email.com', '(41) 99876-0123', '2021-02-20', 2, 'Português', 'cartão'),
('Daniel Ribeiro', 'daniel.ribeiro@email.com', '(51) 98765-1230', '2021-03-05', 1, 'Português', 'cartão'),
('Eduarda Moreira', 'eduarda.moreira@email.com', '(11) 99876-2340', '2021-04-12', 4, 'Português', 'pix'),
('Fábio Correia', 'fabio.correia@email.com', '(21) 98765-3450', '2021-05-18', 3, 'Português', 'cartão'),
('Gabriela Pinto', 'gabriela.pinto@email.com', '(31) 99876-4560', '2021-06-22', 2, 'Português', 'cartão'),
('Henrique Macedo', 'henrique.macedo@email.com', '(41) 98765-5670', '2021-07-30', 1, 'Português', 'boleto'),
('Isabela Duarte', 'isabela.duarte@email.com', '(51) 99876-6780', '2021-08-14', 4, 'Português', 'cartão'),
('José Neto', 'jose.neto@email.com', '(11) 98765-7890', '2021-09-25', 3, 'Português', 'pix'),
('Karen Siqueira', 'karen.siqueira@email.com', '(21) 99876-8900', '2021-10-03', 2, 'Português', 'cartão'),
('Leandro Tavares', 'leandro.tavares@email.com', '(31) 98765-9010', '2021-11-10', 1, 'Português', 'cartão'),
('Larissa Moura', 'larissa.moura@email.com', '(41) 99876-0120', '2021-12-15', 4, 'Português', 'pix'),
('Marcos Andrade', 'marcos.andrade@email.com', '(51) 98765-1235', '2022-01-20', 3, 'Português', 'cartão'),
('Natália Barbosa', 'natalia.barbosa@email.com', '(11) 99876-2345', '2022-02-05', 2, 'Português', 'cartão'),
('Otávio Campos', 'otavio.campos@email.com', '(21) 98765-3455', '2022-03-12', 1, 'Português', 'boleto'),
('Paula Dantas', 'paula.dantas@email.com', '(31) 99876-4565', '2022-04-18', 4, 'Português', 'cartão'),
('Rafael Esteves', 'rafael.esteves@email.com', '(41) 98765-5675', '2022-05-22', 3, 'Português', 'pix'),
('Sandra Fonseca', 'sandra.fonseca@email.com', '(51) 99876-6785', '2022-06-30', 2, 'Português', 'cartão'),
('Tiago Guimarães', 'tiago.guimaraes@email.com', '(11) 98765-7895', '2022-07-14', 1, 'Português', 'cartão'),
('Vanessa Holanda', 'vanessa.holanda@email.com', '(21) 99876-8905', '2022-08-25', 4, 'Português', 'pix'),
('William Iglesias', 'william.iglesias@email.com', '(31) 98765-9015', '2022-09-03', 3, 'Português', 'cartão'),
('Yasmin Júnior', 'yasmin.junior@email.com', '(41) 99876-0125', '2022-10-10', 2, 'Português', 'cartão'),
('Zélia Kessler', 'zelia.kessler@email.com', '(51) 98765-1236', '2022-11-15', 1, 'Português', 'boleto'),
('Alberto Lopes', 'alberto.lopes@email.com', '(11) 99876-2346', '2022-12-20', 4, 'Português', 'cartão'),
('Beatriz Medeiros', 'beatriz.medeiros@email.com', '(21) 98765-3456', '2023-01-05', 3, 'Português', 'pix'),
('Caio Nascimento', 'caio.nascimento@email.com', '(31) 99876-4566', '2023-02-12', 2, 'Português', 'cartão'),
('Débora Oliveira', 'debora.oliveira@email.com', '(41) 98765-5676', '2023-03-18', 1, 'Português', 'cartão'),
('Eu Estudante', 'meu.email@faculdade.edu', '(99) 99999-9999', '2023-04-01', 4, 'Português', 'pix'),
('Minha Mãe', 'mae@email.com', '(99) 88888-8888', '2023-04-01', 3, 'Português', 'cartão'),
('Meu Pai', 'pai@email.com', '(99) 77777-7777', '2023-04-01', 2, 'Português', 'cartão'),
('Minha Irmã', 'irma@email.com', '(99) 66666-6666', '2023-04-01', 1, 'Português', 'boleto'),
('Minha Tia', 'tia@email.com', '(99) 8888-88888', '2023-04-01', 1, 'Português', 'boleto');
-- Inserindo histórico de visualização
INSERT INTO Historico_Visualizacao (id_usuario, id_conteudo, data_visualizacao, progresso_percentual, dispositivo, tempo_assistido_min) VALUES
(1, 1, '2023-01-10 20:15:00', 100, 'Smart TV', 50),
(1, 4, '2023-01-12 21:30:00', 75, 'Smartphone', 156),
(2, 2, '2023-01-15 19:00:00', 100, 'Tablet', 60),
(3, 5, '2023-01-18 22:45:00', 100, 'Smart TV', 124),
(4, 3, '2023-01-20 18:30:00', 50, 'Notebook', 22),
(5, 6, '2023-01-22 17:00:00', 100, 'Smart TV', 50),
(6, 7, '2023-01-25 20:00:00', 100, 'Smartphone', 134),
(7, 8, '2023-01-28 21:15:00', 25, 'Tablet', 12),
(8, 9, '2023-02-01 22:30:00', 100, 'Smart TV', 60),
(9, 10, '2023-02-05 19:45:00', 100, 'Notebook', 60),
(10, 11, '2023-02-10 20:00:00', 100, 'Smart TV', 135),
(41, 1, '2023-04-02 20:00:00', 100, 'Smartphone', 50), 
(41, 5, '2023-04-03 21:30:00', 100, 'Notebook', 124), 
(42, 7, '2023-04-05 19:00:00', 100, 'Smart TV', 134), 
(43, 12, '2023-04-07 18:30:00', 75, 'Tablet', 70), 
(44, 15, '2023-04-10 17:45:00', 100, 'Smartphone', 123); 

-- Inserindo avaliações
INSERT INTO Avaliacoes (id_usuario, id_conteudo, nota, comentario, data_avaliacao, util_count, spoiler) VALUES
(1, 1, 5, 'Excelente série, muito bem produzida!', '2023-01-11', 12, FALSE),
(2, 2, 4, 'Ótima atuação da rainha Elizabeth.', '2023-01-16', 8, FALSE),
(3, 5, 3, 'Bom filme, mas o final poderia ser melhor.', '2023-01-19', 5, FALSE),
(4, 3, 5, 'Melhor série já feita!', '2023-01-21', 20, FALSE),
(5, 6, 5, 'Documentário incrível, todos deveriam assistir.', '2023-01-23', 15, FALSE),
(6, 7, 4, 'Ótima atuação do Rami Malek.', '2023-01-26', 10, FALSE),
(7, 8, 3, 'Boa série, mas um pouco exagerada.', '2023-01-29', 7, FALSE),
(8, 9, 5, 'Mind-blowing! Complexa e fascinante.', '2023-02-02', 18, FALSE),
(9, 10, 4, 'Ótima adaptação do jogo.', '2023-02-06', 9, FALSE),
(10, 11, 5, 'Obra prima do Cuarón.', '2023-02-11', 14, FALSE),
(41, 1, 5, 'Adorei a atmosfera dos anos 80 e a história misteriosa.', '2023-04-03', 2, FALSE), 
(41, 5, 4, 'Bom suspense, me manteve interessado até o final.', '2023-04-04', 1, FALSE), 
(42, 7, 5, 'Que filme emocionante! Freddie Mercury era um gênio.', '2023-04-06', 3, FALSE), 
(43, 12, 4, 'Documentário importante sobre as redes sociais.', '2023-04-08', 0, FALSE), 
(44, 15, 3, 'Divertido, mas um pouco previsível.', '2023-04-11', 1, FALSE); 