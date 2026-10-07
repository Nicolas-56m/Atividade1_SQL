CREATE DATABASE db_Tecnologia;

/* Tabela Cliente */
USE db_Tecnologia;

CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(50) NOT NULL
);

/* Tabela Produto */
USE db_Tecnologia;

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

/* Tabela Venda */
USE db_Tecnologia;

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    dt_entrada DATE NOT NULL,
    qtd INT NOT NULL
);

/* Chaves Estrangeiras conforme o diagrama */
USE db_Tecnologia;

ALTER TABLE venda
ADD CONSTRAINT fk_venda_cliente 
FOREIGN KEY (id_cliente) 
REFERENCES cliente(id_cliente);

USE db_Tecnologia;

ALTER TABLE venda
ADD CONSTRAINT fk_venda_produto
FOREIGN KEY (id_produto) 
REFERENCES produto(id_produto);

/* Inserir Clientes */
USE db_Tecnologia;

INSERT INTO cliente(nome_cliente, email, telefone)
VALUES("Carlos Silva", "carlos@email.com", "19999998888");

INSERT INTO cliente(nome_cliente, email, telefone)
VALUES("Silvano Salles", "sales@email.com", "12399995558");

/* Inserir Produtos */
USE db_Tecnologia;

INSERT INTO produto(nome_produto, preco)
VALUES("Teclado Mecânico", 250.00);

INSERT INTO produto(nome_produto, preco)
VALUES("Cubo Mecânico", 100.00);

/* Inserir Venda */
USE db_Tecnologia;

INSERT INTO venda(id_cliente, id_produto, dt_entrada, qtd)
VALUES(1, 1, "2026-10-06", 2);

INSERT INTO venda(id_cliente, id_produto, dt_entrada, qtd)
VALUES(2, 2, "2026-10-07", 3);

/* Listar todos os clientes */
SELECT * FROM cliente;

/* Listar vendas completas (mostrando nome do cliente e do produto) */
SELECt * from venda;

/* Atualizar o preço do produto com ID 1 */
USE db_Tecnologia;

UPDATE produto 
SET preco = 280.00 
WHERE id_produto = 1;

/* Atualizar o telefone do cliente com ID 1 */
USE db_Tecnologia;

UPDATE cliente 
SET telefone = "19977776666"
WHERE id_cliente = 1;

/* Apagar uma venda com ID 1 */
USE db_Tecnologia;

DELETE FROM venda WHERE id_venda = 1;

/* Apagar um produto com ID 1 (só é possível se não houver vendas atreladas a ele */
USE db_Tecnologia;

DELETE FROM produto WHERE id_produto = 1;