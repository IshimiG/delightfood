
DROP DATABASE IF EXISTS DelightFood;
CREATE DATABASE DelightFood;
USE DelightFood;

CREATE TABLE empleado (
    nss CHAR(9) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NOT NULL,
    dni CHAR(9) NOT NULL UNIQUE
);


INSERT INTO empleado (nss, nombre, apellido1, apellido2, dni) VALUES
('781256721', 'Manolo', 'Castillo', 'Cosio', '62147895B'),
('621804593', 'Juan', 'Pérez', 'García', '78945612C'),
('531068791', 'Ana', 'López', 'Martínez', '45678912D'),
('217841829', 'Pedro', 'Sánchez', 'Rodríguez', '32165498E');


CREATE TABLE camarero (
    nss CHAR(9) PRIMARY KEY,
    FOREIGN KEY (nss) REFERENCES empleado(nss)
);


INSERT INTO camarero (nss) VALUES ('781256721'), ('531068791');


CREATE TABLE cocinero (
    nss CHAR(9) PRIMARY KEY,
    FOREIGN KEY (nss) REFERENCES empleado(nss)
);


INSERT INTO cocinero (nss) VALUES ('621804593'), ('217841829');


CREATE TABLE pinche (
    nss CHAR(9),
    cocinero CHAR(9),
    PRIMARY KEY (nss, cocinero),
    FOREIGN KEY (nss) REFERENCES empleado(nss),
    FOREIGN KEY (cocinero) REFERENCES cocinero(nss)
);


INSERT INTO pinche (nss, cocinero) VALUES ('781256721', '621804593');


CREATE TABLE mesa (
    id_mesa INT PRIMARY KEY AUTO_INCREMENT,
    qr CHAR(30) NOT NULL,
    n_comensales INT NOT NULL,
    ubicacion VARCHAR(30) NOT NULL,
    nss CHAR(9) NOT NULL,
    FOREIGN KEY(nss) REFERENCES camarero(nss)
);


INSERT INTO mesa (qr, n_comensales, ubicacion, nss) 
VALUES ('56721952162', 3, 'Terraza', '531068791');

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    precio_total DOUBLE NOT NULL,
    fecha_pedido DATE NOT NULL,
    id_mesa INT NOT NULL,
    FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa)
);


INSERT INTO pedido (precio_total, fecha_pedido, id_mesa) 
VALUES (20.00, '2025-01-10', 1);


CREATE TABLE plato (
    id_plato INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    tiempo_espera INT NOT NULL,
    precio DOUBLE NOT NULL,
    categoria VARCHAR(20),
    id_pedido INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

INSERT INTO plato (nombre, tiempo_espera, precio, categoria, id_pedido) 
VALUES ('Sushi', 30, 20.00, 'Nigiri', 1);


CREATE TABLE ingrediente (
    id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    cantidad_almacenada INT NOT NULL
);


INSERT INTO ingrediente (nombre, cantidad_almacenada) 
VALUES ('Salmón', 3), ('Arroz', 10);


CREATE TABLE tiene (
    id_ingrediente INT,
    id_plato INT,
    PRIMARY KEY (id_ingrediente, id_plato),
    FOREIGN KEY (id_plato) REFERENCES plato(id_plato),
    FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id_ingrediente)
);


INSERT INTO tiene (id_ingrediente, id_plato) 
VALUES (1, 1), (2, 1);

CREATE TABLE cocina (
     id_plato INT,
     nss CHAR(9),
     PRIMARY KEY (id_plato, nss),
     FOREIGN KEY (id_plato) REFERENCES plato(id_plato),
     FOREIGN KEY (nss) REFERENCES cocinero(nss)
);

INSERT INTO cocina (id_plato, nss) 
VALUES (1, '217841829');
