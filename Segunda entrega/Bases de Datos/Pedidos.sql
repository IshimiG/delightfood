

drop table if exists Pedido;

create table Pedido (
    ID_Pedido int auto_increment primary key,
    Precio_total decimal(10, 2) not null,
    Fecha_Pedido DATE NOT NULL,
    Entregado boolean not null,
    foreign key (ID_Mesa) references Mesa(ID_Mesa)
);