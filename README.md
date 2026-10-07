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

CREATE TABLE cliente(
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

INSERT INTO cliente(nome_cliene, email, telefone)
VALUES("Carlos Silva", "carlos@email.com", "19999998888");

INSERT INTO cliente(nome_cliene, email, telefone)
VALUES("Silvano Salles", "sales@email.com", "12399995558");
```

___

### Inserir os dados dos clientes dentro da tabela Produto
```SQL
USE db_Tecnologia;

INSERT INTO produto(nome_produto, preco)
VALUES("Teclado Mecânico", 250.00);

INSERT INTO produto(nome_produto, preco)
VALUES("Cubo Mecânico", 100.00);
```

___

### Inserir os dados dos clientes dentro da tabela Venda
```SQL
USE db_Tecnologia;

INSERT INTO venda(id_cliente, id_produto, dt_entrada, qtd)
VALUES(1, 1, "2026-10-06", 2);

INSERT INTO venda(id_cliente, id_produto, dt_entrada, qtd)
VALUES(2, 2, "2026-10-07", 3);
```
## CRUD

### Listar todos os clientes
```SQL
SELECT * FROM cliente;
```

### Listar vendas completas (mostrando nome do cliente e do produto)
```SQL
SELECt * from venda;
```

___

### Atualizar o preço do produto com ID 1
```SQL
USE db_Tecnologia;

UPDATE produto 
SET preco = 280.00 
WHERE id_produto = 1;
```

___

### Atualizar o telefone do cliente com ID 1
```SQL
USE db_Tecnologia;

UPDATE cliente 
SET telefone = "19977776666"
WHERE id_cliente = 1;
```

___

### Apagar uma venda com ID 1
```SQL
USE db_Tecnologia;

DELETE FROM venda WHERE id_venda = 1;
```

___

### Apagar um produto com ID 1 (só é possível se não houver vendas atreladas a ele
```SQL
USE db_Tecnologia;

DELETE FROM produto WHERE id_produto = 1;
```

# Atividade2_SQL - Sistema de Biblioteca

## Modelo Entidade-Relacionamento (MER) feito no DRAW.IO
<img width="697" height="837" alt="image" src="https://github.com/user-attachments/assets/a02ef893-ed90-45f5-ab32-75cb5e19e89c" />

### Para criar o Banco de Dados
```SQL
CREATE DATABASE db_Biblioteca
```

___

### Para criar Tabela Aluno
```SQL
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
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
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

### Inserir os dados dos clientes dentro da tabela Aluno
```SQL
USE db_Biblioteca;

INSERT INTO aluno(nome_aluno, email_aluno, curso_aluno)
VALUES("Neymar Augusto", "neymar@email.com", "Mecatrônica");

INSERT INTO aluno(nome_aluno, email_aluno, curso_aluno)
VALUES("Cristiano Ronaldo", "cristiano@email.com", "Tecnologia da Informação");
```

___

### Inserir os dados dos clientes dentro da tabela Livro
```SQL
USE db_Biblioteca;

INSERT INTO livro(titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 1", "Neymar", 2026-10-07);

INSERT INTO livro(titulo_livro, autor_livro, dt_publicacao)
VALUES("Harry Potter 2", "Messi", 2026-09-16);
```

___

### Inserir os dados dos clientes dentro da tabela Empréstimo
```SQL
USE db_Biblioteca;

INSERT INTO venda(id_aluno, id_livro, dt_retirada, dt_devolucao)
VALUES(1, 1, "2026-10-06", "2005-10-09");

INSERT INTO venda(id_aluno, id_livro, dt_retirada, dt_devolucao)
VALUES(2, 2, "2026-10-07", "2000-12-06");
```
## CRUD

### Listar todos os alunos
```SQL
SELECT * FROM aluno;
```

### Listar empréstimos completas (mostrando nome do aluno e do livro)
```SQL
SELECT * FROM emprestimo;
```

___

### Atualizar o nome do livro com ID 1
```SQL
USE db_Biblioteca;

UPDATE livro
SET titulo_livro = "Harry Potter 3"
WHERE id_livro = 1;
```

___

### Atualizar o e-mail do aluno com ID 1
```SQL
USE db_Biblioteca;

UPDATE aluno 
SET = "augusto@email.com"
WHERE id_aluno = 1;
```

___

### Apagar um empréstimo com ID 1
```SQL
USE db_Biblioteca;

DELETE FROM emprestimo WHERE id_emprestimo = 1;
```

___

### Apagar um livro com ID 1 (só é possível se não houver espréstimos atreladas a ele)
```SQL
USE db_Biblioteca;

DELETE FROM livro WHERE id_livro = 1;
```
