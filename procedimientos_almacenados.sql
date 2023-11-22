USE AdventureWorks2019

--1)Crear un procedimiento almacenado en el esquema HumanResources 
--  que dada una determinada inicial, 
--  devuelva codigo, nombre, apellido y direcci�n de correo de los empleados 
--  cuyo nombre coincida con la inicial ingresada
--Vistas: HumanResources.vEmployee
--Campos: BusinessEntityID, FirstName, LastName, EmailAddress

CREATE PROCEDURE HumanResources.Empleado
(
@Inicial CHAR
)
AS
	SELECT BusinessEntityID, Firstname, Lastname, EmailAddress
	FROM humanresources.vEmployee
	WHERE @Inicial = LEFT(FirstName,1);

	
EXECUTE HumanResources.Empleado 'A'

--2)Crear un procedimiento almacenado llamado ProductoVendido 
--  que permita ingresar un producto como par�metro, 
--  si el producto ha sido vendido imprimir el mensaje �El PRODUCTO HA SIDO VENDIDO� 
-- de lo contrario imprimir �El PRODUCTO NO HA SIDO VENDIDO� 
--Tablas: Sales.SalesOrderDetail
--Campos: ProductID

CREATE PROCEDURE dbo.productovendido
(
@producto INT
)
AS
	IF EXISTS (SELECT 1 FROM [Sales].[SalesOrderDetail] WHERE productid=@Producto)
		PRINT'El producto ha sido vendido'
	ELSE
		PRINT'El producto no ha sido vendido'

EXECUTE dbo.productovendido 707;

--3)Crear un procedimiento almacenado en el esquema dbo llamado ActualizaPrecio 
--  recibiendo como par�metros el producto y el precio
--Tablas: Production.Product
--Campos: ProductID, Name, ListPrice

CREATE PROCEDURE  dbo.ActualizarPrecio
(
@producto INT,
@precio MONEY
)
AS
	UPDATE production.product SET listprice=@precio WHERE productid=@producto
	SELECT productid, name, listprice FROM production.product WHERE productid=@producto

EXECUTE dbo.ActualizarPrecio 707,500

SELECT * FROM PRODUCTION.PRODUCT WHERE PRODUCTID = 707

--4)Crear un procedimiento almacenado llamado ProveedorProducto 
--  que devuelva los proveedores que proporcionan el producto especificado por par�metro. 
--Tablas: Purchasing.Vendor, Purchasing.ProductVendor, Production.Product
--Campos: Name
CREATE PROCEDURE dbo.ProveedorProducto
(
@producto int
)
AS
	SELECT pp.name FROM purchasing.vendor vd 
	INNER JOIN purchasing.productvendor pv ON vd.BusinessEntityID=pv.BusinessEntityID
	INNER JOIN production.product pp ON pv.ProductID=pp.ProductID
	WHERE pp.ProductID=@Producto;

EXECUTE dbo.ProveedorProducto 707

--5)Crear un procedimiento almacenado  llamado EmpleadoSector 
--  que devuelva nombre, apellido y sector del empleado que le pasemos como argumento.
-- No es necesario apellido exacto al procedimiento.
--Vistas: HumanResources.vEmployeeDepartmentHistory
--Campos: FirstName, LastName, Department

ALTER PROCEDURE dbo.EmpleadoSector
(
@apellido NVARCHAR(50)='%'
)
AS
	SELECT firstname, lastname, department FROM HumanResources.vEmployeeDepartmentHistory WHERE lastname LIKE @apellido 


execute dbo.EmpleadoSector 'ba%'

