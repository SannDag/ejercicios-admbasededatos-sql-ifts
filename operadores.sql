--------------------------------------------------------------
--						OPERADORES
--------------------------------------------------------------
-- Ejercicios con AdventureWorks
-- BD: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
use AdventureWorks2019

--1) Mostrar los empleados que tienen m�s de 90 horas de vacaciones. 
--tablas: HumanResources.Employee
--campos: VacationHours
SELECT e.vacationhours AS horas_vacaciones, p.lastname AS apellido_persona 
FROM HumanResources.Employee e
INNER JOIN person.person p ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.VacationHours > 90
ORDER BY e.vacationhours asc

--2) Mostrar el nombre, precio y precio con iva de los productos con precio distinto de cero.
--tablas:Production.Product
--campos: Name, ListPrice
SELECT p.name AS nombre_prod, p.listprice AS precio_lista, ROUND(p.listprice * 1.21, 2) AS precio_con_iva
FROM production.product p
WHERE listprice IS NOT NULL AND listprice != 0

--3) Mostrar precio y nombre de los productos 776, 777, 778.
--tablas:Production.Product
--campos: ProductID, Name, ListPrice
SELECT  p.productid AS id_prod, p.listprice AS precio_lista, p.name AS nom_prod
FROM production.product p
WHERE p.productid IN (776,777,778)

--4) Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea johnson.
--tablas:Person.Person
--campos: FirstName, LastName
SELECT p.firstname AS nom_persona, p.lastname AS ape_persona, CONCAT(p.firstname, ' ', p.lastname) AS nom_completo
FROM person.person p
WHERE p.lastname = 'johnson'

--5) Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo precio sea mayor a 500$ de color negro.
--tablas:Production.Product
--campos: ListPrice, Color
SELECT p.color AS color_producto, p.listprice AS precio_prod
FROM production.product p
WHERE (listprice IS NOT NULL AND listprice != 0)
AND ((listprice < 150 AND p.color = 'red' AND p.color = 'Red')
OR (listprice > 500 AND p.color = 'Black' AND p.color = 'black'))

--6) Mostrar el c�digo, fecha de ingreso y horas de vacaciones de los empleados ingresaron a partir del a�o 2000. 
--tablas: HumanResources.Employee
--campos: BusinessEntityID, HireDate, VacationHours
SELECT e.businessentityid AS id_negocio, e.hiredate AS fecha_ingreso, e.vacationhours AS horas_vacaciones
FROM HumanResources.Employee e
WHERE e.hiredate > '2000-01-01'

--7) Mostrar el nombre, n�mero de producto, precio de lista y el precio de lista incrementado en un 10%  
--   de los productos cuya fecha de fin de venta sea anterior al d�a de hoy.
--tablas:Production.Product
--campos: Name, ProductNumber, ListPrice, SellStartDate
SELECT p.name AS nom_prod, p.productnumber AS num_prod, p.listprice AS precio_lista, p.sellenddate AS fecha_ven_final, ROUND(p.listprice * 1.10,2) AS precio_incrementado
FROM production.product p
WHERE p.SellEndDate < GETDATE()
