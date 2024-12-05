**BD DelightFood (2ª Parte)**

- **Normalización**

Mesa = ID_Mesa +  Nº_Comensales + QR + Ubicación  
PK (ID_Mesa)

    1FN Si cumple la primera forma normal debido a que todos datos estan atomizados y la primary key esta ahi.

Pedido = ID_Pedido + Precio_Total + Fecha_Pedido + ID_Mesa   
PK (ID_Pedido)  
FK (ID_Mesa) -> Mesa(ID_Mesa)

    1FN No cumple la primera forma normal, podemos afinar mas Precio_Total, almacena un valor redundante que se deriva de los platos asociados al pedido.

Pedido = ID_Pedido + Fecha_Pedido + Hora_Pedido + ID_Mesa
PK (ID_Pedido)  
FK (ID_Mesa) -> Mesa(ID_Mesa)

    Ahora Pedido si cumple 1FN ya que no hay redundancias y el precio total se puede calcular haciando un metodo que sume el valor de los platos 
    fuera de la base de datos. 
    
    Añadimos Hora_Pedido para realizar cambios en los precios en funcion de la hora el dia de la semana.
    Consultarselo a Diana.

Plato = ID_Plato + Nombre + Tiempo_Espera + Precio + Categoría  
PK (ID_Plato)  
FK (ID_Pedido) -> Pedido(ID_Pedido)

    1FN no se cumple, un plato puede pertenecer a varias Categorias y el precio puede variar dependiendo del dia la hora y demas, no va ha 
    tener el mismo precio de lunes a jueves que el viernes por la noche, por ejemplo.

    Comencemos con Categoría. Como no podemos almacenar varias categorias en una misma celda de la tabla, hay que hacer una tabla intermedia 
    entre Plato y Categoría.

Plato = ID_Plato + Nombre + Tiempo_Espera + Precio
PK = (ID_Plato)

Categoría = ID_Categoria + Nombre
PK = (ID_Categoria)

Plato_Categoria = ID_Plato + ID_Categoria
PK (ID_Plato, ID_Categoria)
FK (ID_Plato -> Plato(ID_Plato))
FK (ID_Categoria -> Categoria(ID_Categoria))

    Con la tabla Plato_Categoria introducimos una tabla que haga de intermediario con plato y almacene multiples categorias. Asi hacemos que cumpla
    la primera forma normal

Precio_Plato = ID_Plato + Dia_Semana + Momento_Dia + Incremento
PK (ID_Pedido, Dia_Semana, Momento_Dia)
FK (ID_Plato -> Plato(ID_Plato))

    Con la tabla Precio_Plato añadimos Dia_Semana y Momento_Dia para almacenar las fluctuaciones de precio que tienen los platos.
    ---Dubitativo--- Debido a que añadimos Hora_Pedido

Precio_Base = ID_Plato + Precio_Base
PK (ID_Plato)

    Añadido para gestion de precios

Ingrediente = ID_Ingrediente + Nombre + Cantidad_Almacenada  
PK (ID_Ingrediente)

Tiene = ID_Plato + ID_Ingrediente + Cantidad  
PK (ID_Plato, ID_Ingrediente)  
FK (ID_Plato_Tiene, ID_Ingrediente_Tiene) -> Plato(ID_Plato), Ingrediente (ID_Ingrediente)

Cocinero = NSS   
PK = NSS  
FK (NSS) -> Empleado (NSS)

Empleado = NSS + nombre + apellido1 + apellido2 + DNI  
CP = (NSS)  
VNN (DNI)

Cocina = ID_Plato + NSS  
PK (ID_Plato,NSS)  
FK (ID_Plato_Cocina, NSS_Cocinero) -> Plato(ID_Plato) Empleado (NSS)

Camarero = NSS CP = NSS  
FK (NSS) -> Empleado (NSS)

Pinche = NSS CP = NSS + rol  
FK (NSS) -> Empleado (NSS)  
FK (rol) -> Cocinero(NSS)


    Resumen 

Mesa = ID_Mesa +  Nº_Comensales + QR + Ubicación  
PK (ID_Mesa)

Pedido = ID_Pedido + Fecha_Pedido + Hora_Pedido + ID_Mesa
PK (ID_Pedido)  
FK (ID_Mesa) -> Mesa(ID_Mesa)

Plato = ID_Plato + Nombre + Tiempo_Espera + Precio
PK = (ID_Plato)

Categoría = ID_Categoria + Nombre
PK = (ID_Categoria)

Plato_Categoria = ID_Plato + ID_Categoria
PK (ID_Plato, ID_Categoria)
FK (ID_Plato -> Plato(ID_Plato))
FK (ID_Categoria -> Categoria(ID_Categoria))

Precio_Plato = ID_Plato + Dia_Semana + Momento_Dia + Incremento
PK (ID_Pedido, Dia_Semana, Momento_Dia)
FK (ID_Plato -> Plato(ID_Plato))

Precio_Base = ID_Plato + Precio_Base
PK (ID_Plato)

Ingrediente = ID_Ingrediente + Nombre + Cantidad_Almacenada  
PK (ID_Ingrediente)

Cocinero = NSS   
PK = NSS  
FK (NSS) -> Empleado (NSS)

Empleado = NSS + nombre + apellido1 + apellido2 + DNI  
CP = (NSS)  
VNN (DNI)

Cocina = ID_Plato + NSS  
PK (ID_Plato,NSS)  
FK (ID_Plato_Cocina, NSS_Cocinero) -> Plato(ID_Plato) Empleado (NSS)

Camarero = NSS CP = NSS  
FK (NSS) -> Empleado (NSS)

Pinche = NSS CP = NSS + rol  
FK (NSS) -> Empleado (NSS)  
FK (rol) -> Cocinero(NSS)




- **Diseño físico (MySQL)**

