CREATE TABLE Clientes (
  id_do_cliente INT PRIMARY KEY,
  primeiro_nome VARCHAR(255),
  sobrenome VARCHAR(255),
  idade INT,
  pais VARCHAR(255)
);

INSERT INTO Clientes (id_do_cliente, primeiro_nome, sobrenome, idade, pais) VALUES
  (1, 'John', 'Corça', 31, 'EUA'),
  (2, 'Roberto', 'Lua', 22, 'EUA'),
  (3, 'Davi', 'Robson', 22, 'Reino Unido'),
  (4, 'John', 'Reinhardt', 25, 'Reino Unido'),
  (5, 'Betty', 'Corça', 28, 'Emirados Árabes Unidos');

CREATE TABLE Pedidos (
  id_do_pedido INT PRIMARY KEY,
  item VARCHAR(255),
  quantia INT,
  id_do_cliente INT,
  FOREIGN KEY (id_do_cliente) REFERENCES Clientes(id_do_cliente)
);

INSERT INTO Pedidos (id_do_pedido, item, quantia, id_do_cliente) VALUES
  (1, 'Teclado', 400, 4),
  (2, 'Rato', 300, 4),
  (3, 'Monitor', 12000, 3),
  (4, 'Teclado', 400, 1),
  (5, 'Mousepad', 250, 2);

CREATE TABLE Envios (
  id_de_envio INT PRIMARY KEY,
  status VARCHAR(255),
  cliente INT,
  FOREIGN KEY (cliente) REFERENCES Clientes(id_do_cliente)
);

INSERT INTO Envios (id_de_envio, status, cliente) VALUES
  (1, 'Pendente', 2),
  (2, 'Pendente', 4);