use practicapreparcial
--tablas:
CREATE TABLE cliente
(
id_cliente INT PRIMARY KEY,
nombre VARCHAR(30),
apellido VARCHAR(30),
direccion VARCHAR(50),
fecha_nac date,
telefono VARCHAR(20),
email VARCHAR(50)
)

CREATE TABLE producto
(
 id_producto INT PRIMARY KEY,
 nombre VARCHAR(30),
 pais_origen VARCHAR(30),
 precio DECIMAL(10,2),
 stock INT,
 id_categoria INT
)

CREATE TABLE categoria
(
 id_categoria INT PRIMARY KEY,
 nombre VARCHAR(30),
 descripcion VARCHAR(50)
)

CREATE TABLE modo_pago_factura
(
 num_pago INT PRIMARY KEY,
 nombre VARCHAR(30),
 otros_detalles VARCHAR(50)
)

CREATE TABLE estado_factura
(
 estado INT PRIMARY KEY,
 descripcion VARCHAR(50)
)

CREATE TABLE factura
(
 n_factura INT PRIMARY KEY,
 fecha DATE,
 id_cliente INT,
 num_pago INT,
 estado INT,
 FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
 FOREIGN KEY (num_pago) REFERENCES modo_pago_factura(num_pago),
 FOREIGN KEY (estado) REFERENCES estado_factura(estado)
)

CREATE TABLE detalle
(
 n_factura INT,
 id_producto INT,
 cantidad INT,
 precio DECIMAL(10,2)
 PRIMARY KEY (n_factura, id_producto),
 FOREIGN KEY (n_factura) REFERENCES factura(n_factura),
 FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
)

use PracticaPreParcial

-- Datos para la tabla cliente
INSERT INTO cliente (id_cliente, nombre, apellido, direccion, fecha_nac, telefono, email)
VALUES
(1, 'Juan', 'Pérez', 'Calle A 123', '1990-01-15', '555-1234', 'juan.perez@email.com'),
(2, 'María', 'Gómez', 'Avenida B 456', '1985-03-22', '555-5678', 'maria.gomez@email.com'),
(3, 'Luis', 'Rodríguez', 'Calle C 789', '1992-08-10', '555-9876', 'luis.rodriguez@email.com'),
(4, 'Ana', 'Fernández', 'Av. Principal 321', '1988-11-05', '555-4321', 'ana.fernandez@email.com'),
(5, 'Elena', 'Martínez', 'Calle D 567', '1995-06-30', '555-8765', 'elena.martinez@email.com'),
(6, 'Miguel', 'González', 'Av. Central 876', '1982-09-18', '555-2109', 'miguel.gonzalez@email.com'),
(7, 'Sofía', 'López', 'Calle E 234', '1998-04-12', '555-1098', 'sofia.lopez@email.com'),
(8, 'Diego', 'Hernández', 'Av. Norte 654', '1987-12-03', '555-8765', 'diego.hernandez@email.com'),
(9, 'Laura', 'Díaz', 'Calle F 876', '1993-10-25', '555-5432', 'laura.diaz@email.com'),
(10, 'Carlos', 'Sánchez', 'Av. Sur 432', '1980-07-15', '555-2345', 'carlos.sanchez@email.com'),
(11, 'Patricia', 'Torres', 'Calle G 789', '1991-02-28', '555-9876', 'patricia.torres@email.com'),
(12, 'Javier', 'Ortiz', 'Av. Oeste 210', '1986-05-20', '555-7654', 'javier.ortiz@email.com'),
(13, 'Natalia', 'Reyes', 'Calle H 987', '1994-08-05', '555-4321', 'natalia.reyes@email.com'),
(14, 'Gabriel', 'Ramírez', 'Av. Este 543', '1984-11-15', '555-2109', 'gabriel.ramirez@email.com'),
(15, 'Valeria', 'Alvarez', 'Calle I 321', '1996-03-10', '555-1098', 'valeria.alvarez@email.com');

-- Datos para la tabla producto
INSERT INTO producto (id_producto, nombre, pais_origen, precio, stock, id_categoria)
VALUES
(1, 'Laptop', 'USA', 1200.00, 50, 1),
(2, 'Smartphone', 'China', 699.99, 100, 2),
(3, 'Impresora', 'Alemania', 299.50, 20, 1),
(4, 'Tablet', 'Corea del Sur', 499.95, 30, 2),
(5, 'Cámara', 'Japón', 899.00, 15, 3),
(6, 'Teclado', 'Taiwán', 49.99, 50, 1),
(7, 'Ratón', 'México', 19.95, 75, 1),
(8, 'Monitor', 'Canadá', 349.50, 25, 3),
(9, 'Altavoces', 'Suecia', 129.99, 40, 4),
(10, 'Auriculares', 'Italia', 89.95, 60, 4),
(11, 'Proyector', 'Holanda', 799.00, 10, 3),
(12, 'Impresora 3D', 'Singapur', 599.50, 5, 2),
(13, 'Escáner', 'Australia', 159.00, 30, 3),
(14, 'Micrófono', 'India', 69.99, 45, 4),
(15, 'Router', 'Francia', 79.95, 55, 1);

-- Datos para la tabla categoria
INSERT INTO categoria (id_categoria, nombre, descripcion)
VALUES
(1, 'Efectivo', 'Pago en efectivo'),
(2, 'Tarjeta de crédito', 'Pago con tarjeta de crédito'),
(3, 'Transferencia bancaria', 'Pago por transferencia bancaria'),
(4, 'PayPal', 'Pago mediante PayPal'),
(5, 'Cheque', 'Pago con cheque'),
(6, 'Bitcoin', 'Pago con Bitcoin'),
(7, 'Stripe', 'Procesador de pagos Stripe'),
(8, 'Venmo', 'Aplicación de pagos Venmo'),
(9, 'Apple Pay', 'Pago con Apple Pay'),
(10, 'Google Pay', 'Pago con Google Pay'),
(11, 'Dinero móvil', 'Pago a través de servicios de dinero móvil'),
(12, 'Criptomoneda', 'Pago con otras criptomonedas'),
(13, 'Vale de regalo', 'Pago con vale de regalo'),
(14, 'Financiamiento', 'Opciones de financiamiento disponibles'),
(15, 'Pago a plazos', 'Posibilidad de pago a plazos');

-- Datos para la tabla modo_pago_factura
INSERT INTO modo_pago_factura (num_pago, nombre, otros_detalles)
VALUES
(1, 'Efectivo', 'Se pagó en efectivo en la tienda'),
(2, 'Tarjeta', 'Se utilizó tarjeta de crédito Visa'),
(3, 'Transferencia', 'Pago por transferencia desde cuenta bancaria'),
(4, 'Cheque', 'Se recibió un cheque para el pago'),
(5, 'Bitcoin', 'Pago exitoso con Bitcoin'),
(6, 'Stripe', 'Pago procesado a través de Stripe'),
(7, 'Venmo', 'Transacción exitosa con Venmo'),
(8, 'Apple Pay', 'Pago realizado con Apple Pay'),
(9, 'Google Pay', 'Se utilizó Google Pay para el pago'),
(10, 'Dinero móvil', 'Pago exitoso con servicio de dinero móvil'),
(11, 'Criptomoneda', 'Transacción completada con criptomonedas'),
(12, 'Vale de regalo', 'Se aplicó un vale de regalo al pago'),
(13, 'Financiamiento', 'Compra financiada con opciones disponibles'),
(14, 'Pago a plazos', 'Cliente eligió pagar a plazos'),
(15, 'Descuento aplicado', 'Se aplicó un descuento al pago');

-- Datos para la tabla estado_factura
INSERT INTO estado_factura (estado, descripcion)
VALUES
(1, 'Pendiente de pago'),
(2, 'Pagada'),
(3, 'Anulada'),
(4, 'En proceso de envío'),
(5, 'Entregada'),
(6, 'Reembolso solicitado'),
(7, 'Reembolso procesado'),
(8, 'Devolución solicitada'),
(9, 'Devolución procesada'),
(10, 'En preparación'),
(11, 'Listo para envío'),
(12, 'En tránsito'),
(13, 'En espera de confirmación'),
(14, 'Confirmado'),
(15, 'Completado');

-- Datos para la tabla factura
INSERT INTO factura (n_factura, fecha, id_cliente, num_pago, estado)
VALUES
(1, '2023-01-05', 1, 1, 1),
(2, '2023-02-10', 2, 2, 2),
(3, '2023-03-15', 3, 3, 1),
(4, '2023-04-20', 4, 4, 4),
(5, '2023-05-25', 5, 5, 5),
(6, '2023-06-30', 6, 6, 2),
(7, '2023-07-05', 7, 7, 3),
(8, '2023-08-10', 8, 8, 8),
(9, '2023-09-15', 9, 9, 6),
(10, '2023-10-20', 10, 10, 10),
(11, '2023-11-25', 11, 11, 11),
(12, '2023-12-30', 12, 12, 12),
(13, '2024-01-04', 13, 13, 13),
(14, '2024-02-09', 14, 14, 14),
(15, '2024-03-15', 15, 15, 15);

-- Datos para la tabla detalle
INSERT INTO detalle (n_factura, id_producto, cantidad, precio)
VALUES
(1, 1, 2, 1200.00),
(1, 2, 1, 699.99),
(2, 3, 3, 299.50),
(2, 4, 1, 499.95),
(3, 5, 1, 899.00),
(3, 6, 2, 49.99),
(4, 7, 3, 19.95),
(4, 8, 1, 349.50),
(5, 9, 2, 129.99),
(5, 10, 1, 89.95),
(6, 11, 1, 199.99),
(7, 12, 2, 59.50),
(7, 13, 1, 799.00),
(8, 14, 3, 129.95),
(8, 15, 1, 499.99),
(9, 1, 2, 1200.00),
(9, 2, 1, 699.99),
(10, 3, 3, 299.50),
(10, 4, 1, 499.95),
(11, 5, 1, 899.00),
(11, 6, 2, 49.99),
(12, 7, 3, 19.95),
(12, 8, 1, 349.50)

-- Datos para la tabla producto
INSERT INTO producto (id_producto, nombre, pais_origen, precio, stock, id_categoria)
VALUES
(1, 'Laptop', 'USA', 1200.00, 50, 1),
(2, 'Smartphone', 'China', 699.99, 100, 2),
(3, 'Impresora', 'Alemania', 299.50, 20, 1),
(4, 'Tablet', 'Corea del Sur', 499.95, 30, 2),
(5, 'Cámara digital', 'Japón', 899.00, 15, 3),
(6, 'Auriculares', 'Suecia', 49.99, 50, 4),
(7, 'Teclado mecánico', 'Taiwán', 19.95, 25, 5),
(8, 'Monitor 24"', 'Corea del Sur', 349.50, 10, 6),
(9, 'Disco duro externo', 'USA', 129.99, 40, 7),
(10, 'Altavoces Bluetooth', 'China', 89.95, 30, 8),
(11, 'Mouse inalámbrico', 'Taiwán', 199.99, 20, 5),
(12, 'Webcam HD', 'Canadá', 59.50, 15, 9),
(13, 'Portátil SSD', 'Alemania', 799.00, 12, 7),
(14, 'Router Wi-Fi', 'USA', 129.95, 18, 10),
(15, 'Impresora láser', 'Japón', 499.99, 8, 1);


-- Obtener las facturas con su detalle que contengan los productos 1, 56 , 96
SELECT *
FROM factura f
INNER JOIN detalle d ON f.n_factura = d.n_factura AND id_producto IN(1,56,96)

-- Crear una función tabla que recibda dos fechas y muestre todas las facturas que estén entre esas dos fechas incluidas,
--mostrando su detalle, información de cliente y el total de lo facturado de acuerdo. Ambas fechas pueden ser nulas.

CREATE FUNCTION mostrarFacturaYCliente (@fecha1 DATE, @fecha2 DATE)
RETURNS TABLE
AS
RETURN
(
    SELECT
        f.n_factura,
        f.fecha,
        c.nombre AS nombre_cliente,
        d.id_producto,
        d.cantidad,
        d.precio,
        d.cantidad * d.precio AS total_linea
    FROM factura f
    LEFT JOIN detalle d ON f.n_factura = d.n_factura
    LEFT JOIN cliente c ON f.id_cliente = c.id_cliente
    WHERE f.fecha BETWEEN @fecha1 AND @fecha2
)

SELECT * FROM dbo.mostrarFacturaYCliente('2023-01-01', '2023-12-30');

--Generar un procedimiento que retorne las facturas que tienen más de 2 productos diferentes. 
-- Indicar el total de los facturados para un rango de fecha1 y fecha2 ingresada por parámetro.

CREATE PROCEDURE retornoFactura (@fecha1 date, @fecha2 date)
AS
BEGIN
	SELECT f.n_factura, SUM(d.cantidad * d.precio) AS totalFacturado
	FROM factura f
	INNER JOIN detalle d ON f.n_factura = d.n_factura
	WHERE f.fecha BETWEEN @fecha1 AND @fecha2
	GROUP BY f.n_factura
	HAVING COUNT(DISTINCT d.id_producto) > 2;
END

SELECT * FROM factura f

execute retornoFactura '2023-01-01', '2023-02-01'

-- Crear un procedimeinto que de la alta de una factura
CREATE PROCEDURE altaFc (@n_factura int, @fecha date, @id_cliente int, @num_pago int, @estado int)
AS

	INSERT INTO factura (n_factura, fecha, id_cliente, num_pago, estado)
	VALUES (@n_factura, @fecha, @id_cliente, @num_pago, @estado)


-- Crear un procedimiento que dado un producto este se de de baja. Solo se permite la baja si este producto no existe en ninguna factura.
-- En caso de poder realizar la baja, retornar 'Producto dado de baja'
-- Si no se pudo dar de baja, retornar 'Este producto no se dió de baja'

CREATE PROCEDURE bajaProducto
    @id_producto INT
AS
BEGIN
    DECLARE @productoEnFactura INT;

    -- Verificar si el producto está presente en alguna factura
    SELECT @productoEnFactura = COUNT(*)
    FROM detalle
    WHERE id_producto = @id_producto;

    IF @productoEnFactura = 0
    BEGIN
        -- El producto no está en ninguna factura, realizar la baja
        DELETE FROM producto
        WHERE id_producto = @id_producto;

        PRINT 'Producto dado de baja';
    END
    ELSE
    BEGIN
        -- El producto está en al menos una factura, no se puede dar de baja
        PRINT 'Este producto no se dio de baja';
    END
END;


-- Crear un procedimiento que dado un idproducto, modificarlo para que su stock sea 0.
CREATE PROCEDURE modificacion
	@id_producto INT
AS
BEGIN
	UPDATE producto SET stock= 0 WHERE id_producto = @id_producto 
END

-- Crear una funcion tabla especifica que permita obtener las facturas de todos los clientes
-- cuyo nombre empieza con un texto por parámetro y no tenga telefono
CREATE FUNCTION obtenerFacturasClientesSinTelefono
	(@texto VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT
        f.n_factura,
        f.fecha,
        c.nombre AS nombre_cliente,
        d.id_producto,
        d.cantidad,
        d.precio,
        d.cantidad * d.precio AS total_linea
    FROM factura f
    INNER JOIN detalle d ON f.n_factura = d.n_factura
    INNER JOIN cliente c ON f.id_cliente = c.id_cliente
    WHERE
        c.nombre LIKE @texto + '%' AND
        (c.telefono IS NULL OR c.telefono = '')
);
