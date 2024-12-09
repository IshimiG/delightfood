drop database if exists DelightFood;
create database DelightFood;
use DelightFood;
create table empleado (
    nss char(9) primary key,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20) not null,
    dni char(9) not null unique
);
create table camarero (
	nss char(9) primary key,
    foreign key (nss) references empleado
);
create table cocinero (
    nss char(9) primary key,
    foreign key (nss) references empleado
);
create table pinche (
    nss char(9) ,
    cocinero char(9) ,
    primary key (nss, cocinero) ,
    foreign key (nss) references empleado,
    foreign key (cocinero) references cocinero
);
create table mesa (
    id_mesa int primary key auto_increment,
    qr char(30) not null,
    n_comensales int not null,
    ubicacion varchar (30) not null,
	nss char(9) not null,
    foreign key(nss) references camarero
);
create table pedido(
    id_pedido int primary key auto_increment,
    precio_total double not null,
    fecha_pedido date not null,
    id_mesa int not null,
    foreign key (id_mesa) references mesa
);
create table plato (
    id_plato int primary key auto_increment,
    nombre varchar(20) not null,
    tiempo_espera datetime not null,
    precio double not null,
    categoria varchar(20),
    id_pedido int not null,
    foreign key (id_pedido) references pedido
);
create table ingrediente(
    id_ingrediente int primary key auto_increment,
    nombre varchar(20) not null,
    cantidad_almacenada int not null
);
create table tiene (
    id_ingrediente int,
    id_plato int,
    primary key (id_ingrediente, id_plato),
    foreign key (id_plato) references plato,
    foreign key (id_ingrediente) references ingrediente
);
create table cocina (
     id_plato int,
     nss char(9),
     primary key (id_plato, nss),
     foreign key (id_plato) references plato,
     foreign key (nss) references cocinero
);

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
    ID_Plato INT PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    Tiempo_Espera INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Categoria VARCHAR(10) NOT NULL,
    ID_Pedido INT NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
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

INSERT into Mesa (ID_Mesa, QR, Numero_Comensales, Ubicacion) 
VALUES ('1', '12345678', '4', 'Terraza');

SELECT * FROM Mesa , 
