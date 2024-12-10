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
