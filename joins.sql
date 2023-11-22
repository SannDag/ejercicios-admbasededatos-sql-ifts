-- Laboratorio JOINS
-- BD: Northwind_sql descarga https://gist.github.com/jmalarcon/e98d20735d17b3160766c041060d1902

use Northwind_sql

-- 1)Mostrar nombre, apellido, titulo, ciudad de empleados y numero de territorio de cada empleado
-- tablas: dbo.Employees, dbo.EmployeeTerritories
SELECT e.firstname AS nombre_empl, e.lastname AS apellido_empl, e.title AS titulo_empl, e.city AS ciudad_empleado, et.territoryID AS id_territorio
FROM employees e
INNER JOIN employeeterritories et ON et.employeeid = e.employeeID

-- 2)Mostrar  los nombre de los clientes alfabéticamente desc y por región de envío de la orden
-- tablas: dbo.Employees, dbo.Region
SELECT c.contactname AS nom_cliente, o.shipregion AS region_envio_orden
FROM customers c
INNER JOIN orders o ON o.customerid = c.customerid
WHERE o.shipregion IS NOT NULL
ORDER BY nom_cliente ASC, region_envio_orden DESC

SELECT c.contactname AS nom_cliente, o.shipregion AS region_envio_orden
FROM customers c
INNER JOIN orders o ON o.customerid = o.customerid
WHERE o.shipregion IS NOT NULL
ORDER BY nom_cliente ASC, region_envio_orden DESC

-- 3)Mostrar productoid, nombre de producto y categoría de producto
-- tablas: dbo.Products, dbo.categories
SELECT p.productid AS id_producto, p.productname AS nombre_producto, c.categoryname AS categoria_producto
FROM products p
INNER JOIN categories c ON p.productid = c.categoryid

-- 4)Mostrar nombre de productos, su categoria y sus proveedores correspondinetes
-- tablas: dbo.Products, dbo.Categories, dbo.Suppliers
SELECT p.productname AS nombre_producto, c.categoryname AS categoria_producto, s.companyname AS proveedor_prod
FROM products p
INNER JOIN categories c ON p.categoryid = c.categoryid
INNER JOIN suppliers s ON p.supplierid = s.supplierid
SELECT * FROM PRODUCTS
SELECT * FROM CATEGORIES

-- 5)Mostrar los nombres de los productos que pertenezcan a la categoria de productos diarios
-- tablas:dbo.Products, dbo.Categories
SELECT p.productname AS nom_prod, c.categoryname AS nom_categoria
FROM products p
INNER JOIN categories c ON p.categoryid = c.categoryid
WHERE p.categoryid = 4

-- 6)Mostrar los precios de aquellos productos donde el precio sea menor a 50 ordenados ASC por nombre de producto,
-- ademas mostrar la categoría a cual corresponde cada uno
-- tablas: dbo.Products, dbo.Categories
SELECT p.unitprice AS precio_prod, p.productname AS nom_prod, c.categoryname AS nom_cat
FROM products p
INNER JOIN categories c ON p.categoryid = c.categoryid
WHERE p.unitprice < 50
ORDER BY p.productname ASC

-- 7)Mostrar las compañias agrupadas por region de envío de ordenes
-- tablas: dbo.Customers, dbo.Orders
SELECT c.companyname AS nom_compania, o.shipregion AS region_envio
FROM customers c 
INNER JOIN orders o ON o.customerid = c.customerid
WHERE o.shipregion IS NOT NULL
GROUP BY c.companyname,o.shipregion


-- 8)Mostrar total de precio unitario agrupando por categoria
-- tablas: dbo.Products, dbo.Categories
SELECT 
	c.categoryname AS nom_cat,
	SUM(unitprice) AS total
FROM products p
INNER JOIN categories c ON p.categoryid  = c.categoryid
WHERE p.unitprice IS NOT NULL
GROUP BY c.categoryname
