- OBS: Os arquivos estão com alguns códigos errados. Aqui no README está tudo corrigido; eu vou corrigir os arquivos na terça-feira.

# Atividade1_SQL - Compra de Produtos

## Modelo Entidade-Relacionamento (MER) feito no DRAW.IO
<img width="709" height="825" alt="image" src="https://github.com/user-attachments/assets/a8d71537-0016-48e0-90f6-3f15376ba8a9" />

### Para criar o Banco de Dados
```SQL
CREATE DATABASE db_Tecnologia;
```

___

### Para criar Tabela Cliente
```SQL
USE db_Tecnologia;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(50) NOT NULL
);
```

___

### Para criar Tabela Produto
```SQL
USE db_Tecnologia;

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);
```

___

### Para criar Tabela Venda
```SQL
USE db_Tecnologia;

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    dt_entrada DATE NOT NULL,
    qtd INT NOT NULL
);
```

___

### Transforma-las em Chaves Estrangeiras conforme o diagrama 
```SQL
USE db_Tecnologia;

ALTER TABLE venda
ADD CONSTRAINT fk_venda_cliente 
FOREIGN KEY (id_cliente) 
REFERENCES cliente(id_cliente);
```
```SQL
USE db_Tecnologia;

ALTER TABLE venda
ADD CONSTRAINT fk_venda_produto
FOREIGN KEY (id_produto) 
REFERENCES produto(id_produto);
```

___

### Inserir os dados dos clientes dentro da tabela Cliente
```SQL
USE db_Tecnologia;

INSERT INTO cliente (nome_cliente, email, telefone)
VALUES ("Carlos Alberto", "alberto@email.com", "19962774499");

INSERT INTO cliente(nome_cliente, email, telefone)
VALUES("Silvano Salles", "sales@email.com", "12399995558");

INSERT INTO cliente (nome_cliente, email, telefone)
VALUES ("João", "joao@email.com", "19988555888");
```
___

### Inserir os dados dos produtos dentro da tabela Produto
```SQL
USE db_Tecnologia;

INSERT INTO produto(nome_produto, preco)
VALUES("Teclado Mecânico", 250.00);

INSERT INTO produto(nome_produto, preco)
VALUES("Cubo Mecânico", 100.00);

INSERT INTO produto(nome_produto, preco)
VALUES ("Teclado", 150.00);
```

___

### Inserir os dados das vendas dentro da tabela Venda
```SQL
USE db_Tecnologia;

INSERT INTO venda(id_cliente, id_produto, dt_entrada, qtd)
VALUES(1, 1, "2026-10-06", 2);

INSERT INTO venda(id_cliente, id_produto, dt_entrada, qtd)
VALUES(2, 2, "2026-10-07", 3);

INSERT INTO venda (id_cliente, id_produto, dt_entrada, qtd)
VALUES (3, 3, "2026-10-03", 1);
```
## CRUD

### Listar todos os clientes
```SQL
SELECT * FROM cliente;
```

### Listar vendas completas (mostrando nome do cliente e do produto)
```SQL
SELECT
    venda.id_venda,
    cliente.nome_cliente,
    produto.nome_produto,
    venda.dt_entrada,
    venda.qtd
FROM venda
INNER JOIN cliente
    ON venda.id_cliente = cliente.id_cliente
INNER JOIN produto
    ON venda.id_produto = produto.id_produto;
```

___

### Atualizar o preço de um produto
```SQL
USE db_Tecnologia;

UPDATE produto
SET preco = 3600.00
WHERE id_produto = 1;
```

___

### Atualizar o telefone de um cliente
```SQL
USE db_Tecnologia;

UPDATE cliente
SET telefone = "19966000666"
WHERE id_cliente = 1;
```

___

### Apagar uma venda
```SQL
USE db_Tecnologia;

DELETE FROM venda
WHERE id_venda = 1;
```

___

### Apagar um produto (Só funciona se ele não estiver sendo usado em nenhuma venda)
```SQL
USE db_Tecnologia;

DELETE FROM produto
WHERE id_produto = 3;
```

# Atividade2_SQL - Sistema de Biblioteca

## Modelo Entidade-Relacionamento (MER) feito no DRAW.IO
<img width="697" height="837" alt="image" src="https://github.com/user-attachments/assets/a02ef893-ed90-45f5-ab32-75cb5e19e89c" />

### Para criar o Banco de Dados
```SQL
CREATE DATABASE db_Biblioteca;
```

___

### Para criar Tabela Aluno
```SQL
USE db_Biblioteca;

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(100) NOT NULL,
    email_aluno VARCHAR(100) NOT NULL,
    curso_aluno VARCHAR(100) NOT NULL
);
```

___

### Para criar Tabela Livro
```SQL
USE db_Biblioteca;

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo_livro VARCHAR(100) NOT NULL,
    autor_livro VARCHAR(100) NOT NULL,
    dt_publicacao DATE NOT NULL
);
```

___

### Para criar Tabela Empréstimo
```SQL
USE db_Biblioteca;

CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    dt_retirada DATE NOT NULL,
    dt_devolucao DATE NOT NULL
);
```

___

### Transforma-las em Chaves Estrangeiras conforme o diagrama 
```SQL
USE db_Biblioteca;

ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_aluno
FOREIGN KEY (id_aluno) 
REFERENCES aluno(id_aluno);
```
```SQL
USE db_Biblioteca;

ALTER TABLE emprestimo
ADD CONSTRAINT fk_emprestimo_livro
FOREIGN KEY (id_livro) 
REFERENCES livro(id_livro);
```

___

### Inserir os dados dos clientes dentro da tabela aluno
```SQL
USE db_Biblioteca;

INSERT INTO aluno (nome_aluno, email_aluno, curso_aluno)
VALUES ("Neymar Salles", "salles@email.com", "Desenvolvimento de Sistemas");

INSERT INTO aluno(nome_aluno, email_aluno, curso_aluno)
VALUES("Cristiano Ronaldo", "cristiano@email.com", "Tecnologia da Informação");

INSERT INTO aluno(nome_aluno, email_aluno, curso_aluno)
VALUES ("João", "joao@email.com", "Informática");
```

___

### Inserir os dados dos clientes dentro da tabela livro
```SQL
USE db_Biblioteca;

INSERT INTO livro(titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 1", "Neymar", "2005-10-07");

INSERT INTO livro(titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 2", "Messi", "2006-09-16");

INSERT INTO livro (titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 3", "Cristiano", "2007-09-18");
```

___

### Inserir os dados dos alunos/livros/empréstimos dentro da tabela emprestimo
```SQL
USE db_Biblioteca;

INSERT INTO emprestimo(id_aluno, id_livro, dt_retirada, dt_devolucao)
VALUES(1, 1, "2026-10-06", "2026-10-09");

INSERT INTO emprestimo(id_aluno, id_livro, dt_retirada, dt_devolucao)
VALUES(2, 2, "2026-10-07", "2026-11-12");

INSERT INTO emprestimo(id_aluno, id_livro, dt_retirada, dt_devolucao)
VALUES(3, 3, "2026-11-09", "2026-12-10");
```

## CRUD

### Listar todos os alunos
```SQL
SELECT * FROM aluno;
```

### Listar empréstimos completos (mostrando nome do aluno e do livro)
```SQL
SELECT
    emprestimo.id_emprestimo,
    aluno.nome_aluno,
    livro.titulo_livro,
    emprestimo.dt_retirada,
    emprestimo.dt_devolucao
FROM emprestimo
INNER JOIN aluno
    ON emprestimo.id_aluno = aluno.id_aluno
INNER JOIN livro
    ON emprestimo.id_livro = livro.id_livro;
```

___

### Atualizar o título do livro
```SQL
USE db_Biblioteca;

UPDATE livro
SET titulo_livro = "Harry Potter e a Pedra Filosofal"
WHERE id_livro = 1;
```

___

### Atualizar o e-mail do aluno
```SQL
USE db_Biblioteca;

UPDATE aluno
SET email_aluno = "novoemail@email.com"
WHERE id_aluno = 1;
```

___

### Apagar um empréstimo
```SQL
USE db_Biblioteca;

DELETE FROM emprestimo
WHERE id_emprestimo = 1;
```

___

### Apagar um livro (Só funciona se o livro não estiver relacionado a nenhum empréstimo.)
```SQL
USE db_Biblioteca;

DELETE FROM livro
WHERE id_livro = 2;
```
