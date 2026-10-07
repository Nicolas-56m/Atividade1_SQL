# Atividade1_SQL

## Modelo Entidade-Relacionamento (MER) feito no DRAW.IO
<img width="830" height="837" alt="image" src="https://github.com/user-attachments/assets/ddacb25a-94f1-4a45-b4a0-5f734084ac31" />

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
