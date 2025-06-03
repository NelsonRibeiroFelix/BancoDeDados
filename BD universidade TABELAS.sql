-- Script de criação do banco de dados para a biblioteca universitária
-- Feito por um aluno de ADS do segundo semestre :)

-- Criar o banco de dados se ele ainda não existir
CREATE DATABASE IF NOT EXISTS biblioteca_universitaria_ads;
USE biblioteca_universitaria_ads;

-- Tabela para guardar os dados dos Autores dos livros
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY, -- ID único do autor, gerado automaticamente
    nome VARCHAR(100) NOT NULL, -- Nome completo do autor (obrigatório)
    nacionalidade VARCHAR(50), -- País de origem do autor
    data_nascimento DATE, -- Data de nascimento do autor
    biografia TEXT -- Um texto curtinho sobre o autor (campo extra!)
);

-- Tabela para guardar os dados dos Livros da biblioteca
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY, -- ID único do livro, gerado automaticamente
    titulo VARCHAR(255) NOT NULL, -- Título do livro (obrigatório)
    id_autor INT NOT NULL, -- ID do autor do livro (chave estrangeira para a tabela Autores)
    ano_publicacao YEAR, -- Ano em que o livro foi publicado
    genero VARCHAR(100), -- Gênero do livro (ex: Fantasia, Romance)
    descricao TEXT, -- Uma descrição do livro
    disponibilidade ENUM('Disponível', 'Emprestado', 'Reservado') DEFAULT 'Disponível' NOT NULL, -- Se o livro está disponível ou não
    editora VARCHAR(100), -- Nome da editora do livro (campo extra!)
    -- Definindo que id_autor nesta tabela se refere ao id_autor da tabela Autores
    CONSTRAINT fk_livros_autores FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
    -- Se um autor for deletado, não deixa deletar se tiver livros associados (RESTRICT)
    -- Se o ID do autor for atualizado, atualiza aqui também (CASCADE)
);

-- Tabela para guardar os dados dos Usuários da biblioteca (alunos, professores, etc.)
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- ID único do usuário, gerado automaticamente
    nome VARCHAR(100) NOT NULL, -- Nome completo do usuário (obrigatório)
    email VARCHAR(100) NOT NULL UNIQUE, -- E-mail do usuário (obrigatório e único)
    telefone VARCHAR(20), -- Número de telefone para contato
    data_cadastro DATE DEFAULT (CURRENT_DATE()), -- Data em que o usuário foi cadastrado (preenche sozinho com a data de hoje)
    endereco VARCHAR(255) -- Endereço completo do usuário (campo extra!)
);

-- Tabela para registrar os Empréstimos de livros
CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY, -- ID único do empréstimo, gerado automaticamente
    id_usuario INT NOT NULL, -- ID do usuário que fez o empréstimo (chave estrangeira para Usuarios)
    id_livro INT NOT NULL, -- ID do livro emprestado (chave estrangeira para Livros)
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Data e hora do empréstimo (preenche sozinho)
    data_devolucao_prevista DATE NOT NULL, -- Data que o livro deveria ser devolvido (obrigatório)
    data_devolucao_real DATETIME, -- Data e hora real da devolução (pode ser nulo se não devolveu ainda)
    status_emprestimo ENUM('Ativo', 'Devolvido', 'Atrasado') DEFAULT 'Ativo' NOT NULL, -- Situação do empréstimo
    observacoes TEXT, -- Alguma observação sobre o empréstimo (campo extra!)
    -- Definindo as chaves estrangeiras para Usuarios e Livros
    CONSTRAINT fk_emprestimos_usuarios FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_emprestimos_livros FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
        ON DELETE RESTRICT ON UPDATE CASCADE
    -- Por enquanto, sem validações complexas de datas aqui, o básico é suficiente.
);

-- Tabela para registrar as Reservas de livros
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY, -- ID único da reserva, gerado automaticamente
    id_usuario INT NOT NULL, -- ID do usuário que fez a reserva (chave estrangeira para Usuarios)
    id_livro INT NOT NULL, -- ID do livro reservado (chave estrangeira para Livros)
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Data e hora da reserva (preenche sozinho)
    status_reserva ENUM('Pendente', 'Ativa', 'Cancelada', 'Concluída') DEFAULT 'Pendente' NOT NULL, -- Situação da reserva
    data_expiracao DATE, -- Data até quando a reserva é válida (campo extra!)
    -- Definindo as chaves estrangeiras para Usuarios e Livros
    CONSTRAINT fk_reservas_usuarios FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_reservas_livros FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    -- Garante que um usuário só pode ter uma reserva para o mesmo livro ao mesmo tempo
    CONSTRAINT uq_reserva_usuario_livro UNIQUE (id_usuario, id_livro)
    -- Por enquanto, sem validações complexas de datas aqui.
);