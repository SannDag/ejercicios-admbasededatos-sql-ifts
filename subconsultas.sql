--SUBCONSULTAS
------------------------------------------------------------------
use adventureworks2019

--1)Listar todos las productos cuyo precio sea inferior al precio 
--  promedio de todos los productos
--tablas:Production.Product
--campos: Name, ListPrice
SELECT name, listprice
FROM production.product
WHERE listprice < (SELECT AVG(listprice) FROM production.product) AND listprice IS NOT NULL AND listprice != 0

--2)Listar  el nombre, precio de lista, precio promedio y diferencia 
--  de precios entre cada producto
--  y el valor promedio general
--tablas:Production.Product
--campos: Name, ListPrice
SELECT name producto, listprice[precio de lista],
	(SELECT AVG(listprice) FROM Production.product) promedio,
	listprice - (SELECT AVG(listprice) FROM production.product) [diferencia de precio] FROM production.product

--3)Mostrar el o los códigos del producto mas caro
--tablas:Production.Product
--campos: ProductID,ListPrice
SELECT productid[id_producto], listprice[lista_precios]	
FROM production.product
WHERE listprice=(SELECT MAX(listprice) max_price FROM production.product)

--4)Mostrar el producto más barato de cada subcategoría. mostrar subcategoría, 
--código de producto y el precio de lista más barato ordenado por subcategoría
--tablas:Production.Product
--campos: ProductSubcategoryID, ProductID, ListPrice
SELECT p.productsubcategoryid, p.productid[id_product], p.listprice[lista_precios]
FROM production.product p
WHERE listprice = (SELECT MIN(listprice) FROM production.product WHERE productsubcategoryid = p.productsubcategoryid)
ORDER BY p.ProductSubcategoryID

------------------------------------------------------------------------
--SUBCONSULTAS CON EXISTS - NOT EXISTS
------------------------------------------------------------------------

--1)Mostrar los nombres de todos los productos presentes 
--  en la subcategoría de ruedas 
--tablas:Production.Product, Production.ProductSubcategory
--campos: ProductSubcategoryID, Name
SELECT productsubcategoryid, name
FROM production.product p
WHERE EXISTS (SELECT * FROM production.productsubcategory WHERE productsubcategoryid = p.productsubcategoryid AND name like '%Wheels%')

--2)Mostrar todos los productos que no fueron vendidos
--tablas:Production.Product, Sales.SalesOrderDetail
--campos: Name, ProductID
SELECT p.name[nom_prod], p.productid[id_prod]
FROM production.product p
WHERE NOT EXISTS (SELECT 1 FROM sales.salesorderdetail WHERE productid = p.productid)

--3)Mostrar la cantidad de personas que no son vendedores 
--tablas: Person.Person, Sales.SalesPerson
--campos: BusinessEntityID 
SELECT COUNT(p.businessentityid)[id_business]
FROM person.person p
WHERE NOT EXISTS (SELECT businessentityid FROM sales.salesperson WHERE businessentityid = p.businessentityid)

--4)Mostrar todos los vendedores (nombre y apellido) que no tengan asignado 
-- un territorio de ventas 
--tablas: Person.Person, Sales.SalesPerson
--campos: BusinessEntityID, TerritoryID, LastName, FirstName
SELECT p.firstname AS nombre_pers, p.lastname AS apellido
FROM person.person p
WHERE EXISTS (SELECT 1 FROM sales.salesperson WHERE businessentityid = p.businessentityid AND territoryid IS NULL)

------------------------------------------------------------------------
--SUBCONSULTAS CON IN Y NOT IN
------------------------------------------------------------------------
--1)Mostrar las órdenes de venta que se hayan facturado en territorio de estado unidos
--únicamente 'us' 
--tablas: Sales.SalesOrderHeader, Sales.SalesTerritory
--campos: CountryRegionCode, TerritoryID
SELECT * FROM sales.salesorderheader soh
WHERE soh.territoryid IN (SELECT territoryid FROM sales.salesterritory WHERE countryregioncode = 'us')

--2)Al ejercicio anterior agregar ordenes de Francia e Inglaterra 
--tablas: Sales.SalesOrderHeader, Sales.SalesTerritory
--campos: CountryRegionCode, TerritoryID
SELECT * FROM sales.salesorderheader soh
WHERE soh.territoryid IN (SELECT territoryid FROM sales.salesterritory WHERE countryregioncode IN('us','fr','en'))

--3)Mostrar los nombres de los diez productos más caros 
--tablas:Production.Product
--campos: ListPrice
SELECT p.name AS nom_producto, p.listprice AS precio
FROM production.product p
WHERE listprice IN (SELECT TOP 10 listprice FROM production.product ORDER BY listprice desc)

--4)Mostrar aquellos productos cuya cantidad de pedidos de venta 
--  sea igual o superior a 20 
--tablas:Production.Product, Sales.SalesOrderDetail
--campos: Name, ProductID , OrderQty
SELECT p.name AS nom_producto, p.productid AS id_prod
FROM production.product p
WHERE productid IN (SELECT productid FROM sales.salesorderdetail WHERE orderqty >= 20 GROUP BY productid)
ORDER BY name
