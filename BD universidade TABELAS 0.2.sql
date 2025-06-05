-- Criar o banco de dados se ele ainda não existir
CREATE DATABASE IF NOT EXISTS biblioteca_universitaria_ads;
USE biblioteca_universitaria_ads;

-- Tabela Autores
CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(100),
    data_nascimento DATE,
    biografia_curta TEXT
);

-- Tabela Livros
CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    ano_publicacao INT,
    genero VARCHAR(100),
    descricao TEXT,
    disponibilidade BOOLEAN DEFAULT TRUE,
    isbn VARCHAR(20) UNIQUE, 
    edicao VARCHAR(50),
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

-- Tabela Usuários
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    tipo_usuario VARCHAR(50) DEFAULT 'aluno'
);

-- Tabela Empréstimos
CREATE TABLE Emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    status VARCHAR(50) NOT NULL DEFAULT 'ativo', -- 'ativo', 'devolvido', 'atrasado'
    multa_aplicada DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_livro) REFERENCES Livros(id),
    CHECK (data_devolucao_real IS NULL OR data_devolucao_real >= DATE(data_emprestimo)),
    CHECK (data_devolucao_prevista >= DATE(data_emprestimo))
);

-- Tabela Reservas
CREATE TABLE Reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_reserva DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_reserva VARCHAR(50) NOT NULL DEFAULT 'ativa', -- 'ativa', 'atendida', 'cancelada', 'expirada'
    data_limite_retirada DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_livro) REFERENCES Livros(id),
    CHECK (data_limite_retirada IS NULL OR data_limite_retirada > data_reserva)
);