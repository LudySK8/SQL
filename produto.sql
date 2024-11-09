CREATE TABLE produto (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    quantidade INT
);

ALTER TABLE produto ADD descricao TEXT;

DROP TABLE produto;

CREATE TABLE produto (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    quantidade INT,
    descricao TEXT
);

INSERT INTO produto (id, nome, preco, quantidade, descricao) 
VALUES (1, 'Produto A', 29.99, 100, 'Descrição do Produto A');

UPDATE produto 
SET preco = 24.99 
WHERE id = 1;

DELETE FROM produto WHERE id = 1;