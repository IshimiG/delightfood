drop database if exists DelightFood;

create database DelightFood;

use DelightFood;

CREATE TABLE Mesa (
    ID_Mesa INT PRIMARY KEY,
    QR VARCHAR(255),
    Numero_Comensales INT NOT NULL,
    Ubicacion VARCHAR(20)
);

INSERT INTO Mesa (ID_Mesa, QR, Numero_Comensales, Ubicacion) 
VALUES (1, '234513252345645748', 4, 'Terraza');


CREATE TABLE Empleado (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    Apellido1 VARCHAR(10) NOT NULL,
    Apellido2 VARCHAR(10),
    NSS VARCHAR(12) NOT NULL UNIQUE
);

INSERT INTO Empleado (DNI, Nombre, Apellido1, Apellido2, NSS) 
VALUES ('45904019K', 'Limoncio', 'Inaceptable', NULL, '10293829184');


CREATE TABLE Camarero (
    DNI VARCHAR(9) PRIMARY KEY,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);

INSERT INTO Camarero (DNI)
VALUES ('45904019K');


CREATE TABLE Pinche (
    DNI VARCHAR(9) PRIMARY KEY,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);

INSERT INTO Pinche (DNI)
VALUES ('38201938475');


CREATE TABLE Cocinero (
    DNI VARCHAR(9) PRIMARY KEY,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);

INSERT INTO Cocinero (DNI)
VALUES ('45904019K');

CREATE TABLE Esta_a_cargo (
    Cocinero_DNI VARCHAR(9),
    Pinche_DNI VARCHAR(9),
    PRIMARY KEY (Cocinero_DNI, Pinche_DNI),
    FOREIGN KEY (Cocinero_DNI) REFERENCES Cocinero(DNI),
    FOREIGN KEY (Pinche_DNI) REFERENCES Pinche(DNI)
);

INSERT INTO Esta_a_cargo (Cocinero_DNI, Pinche_DNI) 
VALUES ('45904019K', '38201938475');


CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Fecha_Pedido DATE NOT NULL,
    Precio_Total DECIMAL(10, 2) NOT NULL,
    ID_Mesa INT NOT NULL,
    FOREIGN KEY (ID_Mesa) REFERENCES Mesa(ID_Mesa)
);

INSERT INTO Pedido (ID_Pedido, Fecha_Pedido, Precio_Total, ID_Mesa) 
VALUES (23, '2024-12-10', 10.50, 1);

CREATE TABLE Plato (
    ID_Plato INT PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    Tiempo_Espera INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Categoria VARCHAR(10) NOT NULL,
    ID_Pedido INT NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

INSERT INTO Plato (ID_Plato, Nombre, Tiempo_Espera, Precio, Categoria, ID_Pedido) 
VALUES (1, 'Sushi', 10, 4.20, 'Sushi', 23);

CREATE TABLE Ingrediente (
    ID_Ingrediente INT PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    Cantidad_Almacenada DECIMAL(10, 2) NOT NULL
);

INSERT INTO Ingrediente (ID_Ingrediente, Nombre, Cantidad_Almacenada) 
VALUES (1, 'Pepino', 64.00);

CREATE TABLE Tiene (
    ID_Plato INT,
    ID_Ingrediente INT,
    Cantidad DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID_Plato, ID_Ingrediente),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingrediente(ID_Ingrediente)
);

INSERT INTO Tiene (ID_Plato, ID_Ingrediente, Cantidad) 
VALUES (1, 1, 1.00);

CREATE TABLE Cocina (
    DNI_Empleado VARCHAR(9),
    ID_Plato INT,
    PRIMARY KEY (DNI_Empleado, ID_Plato),
    FOREIGN KEY (DNI_Empleado) REFERENCES Empleado(DNI),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato)
);

INSERT INTO Cocina (DNI_Empleado, ID_Plato) 
VALUES ('45904019K', 1);

SELECT * FROM Mesa , 
SELECT * FROM Pedido;
SELECT * FROM Plato;
