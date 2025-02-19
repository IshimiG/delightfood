CREATE DATABASE IF NOT EXISTS delightfood;

USE delightfood;

CREATE TABLE IF NOT EXISTS Mesa (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    token VARCHAR(50) NOT NULL,
    n_comensales INT NOT NULL,
    ubicación VARCHAR(50) NOT NULL
);

DROP TAbLE IF EXISTS Reserva;
CREATE TABLE Reserva(
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    num_comensales INT NOT NULL,
    notas VARCHAR (255),
    fecha_reserva DATE NOT NULL,
    id_mesa INT NOT NULL,
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa)
);

DROP TAbLE IF EXISTS Pedido;
CREATE TABLE Pedido (
    id_pedido int auto_increment PRIMARY KEY,
    precio_total DECIMAL(10, 2) NOT NULL,
    fecha_pedido DATE NOT NULL,
    entregado BOOLEAN NOT NULL,
    id_mesa INT NOT NULL,
    FOREIGN KEY  (id_mesa) REFERENCES Mesa(id_mesa)
);

DROP TABLE IF EXISTS Item_pedido;
CREATE TABLE Item_pedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    id_pedido INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

DROP TABLE IF EXISTS Plato;
CREATE TABLE Plato (
    id_plato INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL,
    code_img VARCHAR(50) NOT NULL,
    tiempo_estimado INT NOT NULL, -- En segundos
    precio DOUBLE NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    id_item_pedido INT NOT NULL,
    FOREIGN KEY (id_item_pedido) REFERENCES Item_Pedido(id_item_pedido)
);

INSERT INTO Mesa (token, n_comensales, ubicación) VALUES
('', 4, 'Terraza'),
('', 2, 'Interior'),
('', 6, 'Patio'),
('', 4, 'Terraza'),
('', 2, 'Interrior'),
('', 6, 'patio');

INSERT INTO Reserva (num_comensales, notas, fecha_reserva, id_mesa) VALUES
(4, 'Cumpleaños', '2025-02-20', 1),
(2, 'Cena romantica', '2025-02-21', 2),
(6, 'Reunión familiar', '2025-02-22', 3),
(4, 'Cena de negocios', '2025-02-23', 4),
(2, 'Aniversario', '2025-02-24', 5),
(6, 'Fiesta sorpresa', '2025-02-25', 6);

INSERT INTO Pedido (precio_total, fecha_pedido, entregado, id_mesa) VALUES
(45.50, '2025-02-20', FALSE, 1),
(22.30, '2025-02-21', TRUE, 2),
(78.90, '2025-02-22', FALSE, 3),
(55.60, '2025-02-23', TRUE, 4),
(33.20, '2025-02-24', FALSE, 5),
(88.70, '2025-02-25', TRUE, 6);

INSERT INTO Item_pedido (cantidad, id_pedido) VALUES
(2, 1),
(1, 1),
(3, 2),
(1, 3),
(2, 3),
(1, 4),
(2, 4),
(3, 5),
(1, 6),
(2, 6);

INSERT INTO Plato (label, code_img, tiempo_estimado, precio, categoria, id_item_pedido) VALUES
('Sushi Nigiri', 'nigiri1', 600, 9.50, 'Nigiri', 1),
('Sushi Maki', 'maki1', 600, 8.00, 'Maki', 2),
('Sushi Temaki', 'temaki1', 600, 10.00, 'Temaki', 3),
('Sushi California Roll', 'roll1', 600, 12.00, 'Roll', 4),
('Sashimi de Salmón', 'sashimi1', 600, 15.00, 'Sashimi', 5),
('Sashimi de Atún', 'sashimi2', 600, 16.00, 'Sashimi', 6),
('Tartar de Atún', 'tartar1', 900, 18.00, 'Tartar', 7),
('Tempura de Camarón', 'tempura1', 1200, 12.00, 'Tempura', 8),
('Edamame', 'edamame', 300, 5.00, 'Entrante', 9),
('Sopa Miso', 'sopa1', 600, 4.50, 'Sopa', 10);