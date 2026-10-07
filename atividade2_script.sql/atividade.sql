CREATE DATABASE db_Bibloteca

USE db_Biblioteca;

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(100) NOT NULL,
    email_aluno VARCHAR(100) NOT NULL,
    curso aluno VARCHAR(100) NOT NULL
);

USE db_Biblioteca;

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo_livro VARCHAR(100) NOT NULL,
    autor_livro VARCHAR(100) NOT NULL,
    dt_publicacao DATE NOT NULL
);

USE db_Biblioteca;

CREATE TABLE emprestimo (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    dt_retirada DATE NOT NULL,
    dt_devolucao DATE NOT NULL
);

USE db_Biblioteca;

ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_aluno
FOREIGN KEY (id_aluno) 
REFERENCES aluno(id_aluno);

USE db_Biblioteca;

ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_livro
FOREIGN KEY (id_livro) 
REFERENCES aluno(id_livro);

USE db_Biblioteca;

INSERT INTO aluno(nome_aluno, email_aluno, curso_aluno)
VALUES("Neymar Augusto", "neymar@email.com", "Mecatrônica");

INSERT INTO aluno(nome_aluno, email_aluno, curso_aluno)
VALUES("Cristiano Ronaldo", "cristiano@email.com", "Tecnologia da Informação");

USE db_Biblioteca;

INSERT INTO livro(titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 1", "Neymar", 2026-10-07);

INSERT INTO livro(titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 2", "Messi", 2026-09-16);

USE db_Biblioteca;

INSERT INTO venda(id_aluno, id_livro, dt_retirada, dt_publicacao)
VALUES(1, 1, "2026-10-06", "2005-10-09");

INSERT INTO venda(id_aluno, id_livro, dt_retirada, dt_publicacao)
VALUES(2, 2, "2026-10-07", "2000-12-06");

SELECT * FROM aluno;

SELECt * from emprestimo;

USE db_Biblioteca;

UPDATE livro
SET titulo_livro = "Harry Potter 3"
WHERE id_livro = 1;

USE db_Biblioteca;

UPDATE aluno 
SET = "augusto@email.com"
WHERE id_aluno = 1;

USE db_Biblioteca;

DELETE FROM emprestimo WHERE id_emprestimo = 1;

USE db_Biblioteca;

DELETE FROM livro WHERE id_livro = 1;