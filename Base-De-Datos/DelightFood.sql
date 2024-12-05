drop database if exists DelightFood;

create database DelightFood;

use DelightFood;

CREATE TABLE Mesa (
    ID_Mesa INT PRIMARY KEY,
    QR VARCHAR(255),
    Numero_Comensales INT NOT NULL,
    Ubicacion VARCHAR(20)
);


CREATE TABLE Empleado (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    Apellido1 VARCHAR(10) NOT NULL,
    Apellido2 VARCHAR(10),
    NSS VARCHAR(12) NOT NULL UNIQUE
);


CREATE TABLE Camarero (
    DNI VARCHAR(9) PRIMARY KEY,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);


CREATE TABLE Pinche (
    DNI VARCHAR(9) PRIMARY KEY,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);


CREATE TABLE Cocinero (
    DNI VARCHAR(9) PRIMARY KEY,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);


CREATE TABLE Esta_a_cargo (
    Cocinero_DNI VARCHAR(9),
    Pinche_DNI VARCHAR(9),
    PRIMARY KEY (Cocinero_DNI, Pinche_DNI),
    FOREIGN KEY (Cocinero_DNI) REFERENCES Cocinero(DNI),
    FOREIGN KEY (Pinche_DNI) REFERENCES Pinche(DNI)
);


CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Fecha_Pedido DATE NOT NULL,
    Precio_Total DECIMAL(10, 2) NOT NULL,
    ID_Mesa INT NOT NULL,
    FOREIGN KEY (ID_Mesa) REFERENCES Mesa(ID_Mesa)
);


CREATE TABLE Plato (
    ID_Plato INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Tiempo_Espera INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL
);

CREATE TABLE Plato_Categoria (
    ID_Plato INT NOT NULL,
    ID_Categoria INT NOT NULL,
    PRIMARY KEY (ID_Plato, ID_Categoria),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato),
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

CREATE TABLE Precio_Plato (
    ID_Plato INT NOT NULL,
    Dia_Semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    Momento_Dia ENUM('Comida', 'Cena') NOT NULL,
    Incremento DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (ID_Plato, Dia_Semana, Momento_Dia),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato)
);

CREATE TABLE Precio_Base (
    ID_Plato INT NOT NULL PRIMARY KEY,
    Precio_Base DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato)
);

CREATE TABLE Ingrediente (
    ID_Ingrediente INT PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    Cantidad_Almacenada DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Tiene (
    ID_Plato INT,
    ID_Ingrediente INT,
    Cantidad DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID_Plato, ID_Ingrediente),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingrediente(ID_Ingrediente)
);


CREATE TABLE Cocina (
    DNI_Empleado VARCHAR(9),
    ID_Plato INT,
    PRIMARY KEY (DNI_Empleado, ID_Plato),
    FOREIGN KEY (DNI_Empleado) REFERENCES Empleado(DNI),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato)
);
