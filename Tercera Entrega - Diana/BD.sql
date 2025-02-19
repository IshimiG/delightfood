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
