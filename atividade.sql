CREATE TABLE Produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15)
);

CREATE TABLE Venda (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    data_venda DATE DEFAULT CURRENT_DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE ProdutoVenda (
    id_produto_venda SERIAL PRIMARY KEY,
    id_venda INT REFERENCES Venda(id_venda),
    id_produto INT REFERENCES Produto(id_produto),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
);

INSERT INTO Produto (nome, preco, quantidade_estoque) VALUES 
('Produto A', 25.00, 100),
('Produto B', 15.50, 200),
('Produto C', 10.00, 150);

INSERT INTO Cliente (nome, email, telefone) VALUES 
('Cliente 1', 'cliente1@example.com', '1111111111'),
('Cliente 2', 'cliente2@example.com', '2222222222');

INSERT INTO Venda (id_cliente, total) VALUES 
(1, 55.00);

INSERT INTO ProdutoVenda (id_venda, id_produto, quantidade, preco_unitario) VALUES 
(1, 1, 2, 25.00),
(1, 2, 1, 15.50);

SELECT * FROM Produto;

SELECT * FROM Cliente;

SELECT * FROM Venda;

SELECT * FROM ProdutoVenda;

SELECT v.id_venda, c.nome AS cliente, v.data_venda, v.total 
FROM Venda v
JOIN Cliente c ON v.id_cliente = c.id_cliente;

SELECT pv.id_venda, p.nome AS produto, pv.quantidade, pv.preco_unitario 
FROM ProdutoVenda pv
JOIN Produto p ON pv.id_produto = p.id_produto
WHERE pv.id_venda = 1;