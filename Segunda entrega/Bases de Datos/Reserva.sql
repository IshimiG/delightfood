CREATE TABLE Reserva(
    id_reserva (VARCHAR, 20) PRIMARY KEY,
    num_comensales (INT) NOT NULL,
    notas (VARCHAR, 255),
    fecha_reserva (DATE) NOT NULL,
    id_mesa (VARCHAR, 20) NOT NULL,
);