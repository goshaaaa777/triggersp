USE AdventureWorks2019
GO

----------------------------------------------------------------------------------------------------

SELECT TOP(10)*  FROM Sales.SalesOrderHeader 
SELECT TOP 10 * FROM Sales.SalesOrderHeader

----------------------------------------------------------------------------------------------------
SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate >='01/01/2014'

----------------------------------------------------------------------------------------------------

SELECT * FROM Sales.SalesOrderHeader 
SELECT * FROM Sales.SalesOrderDetail

----------------------------------------------------------------------------------------------------
SELECT * FROM Sales.SalesOrderHeader SA
LEFT JOIN Sales.SalesOrderDetail SO
ON SA.SalesOrderID =SO.SalesOrderID
WHERE OrderDate >='01/01/2012'

------------------------------------------------------------------------------------------------

SELECT 
SA.OrderDate as 'Fecha_Orden',
SA.ShipDate as 'Fecha_Envio',
SO.ProductID as 'Id_Producto'
FROM Sales.SalesOrderHeader SA
LEFT JOIN Sales.SalesOrderDetail SO
ON SA.SalesOrderID =SO.SalesOrderID

------------------------------------------------------------------------------------------------

SELECT * FROM Production.Product
SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory

SELECT * FROM Production.Product AS P
INNER JOIN Production.ProductSubcategory AS C
ON P.ProductSubcategoryID = C.ProductCategoryID

SELECT * FROM Production.Product AS P
LEFT JOIN Production.ProductSubcategory AS C
ON P.ProductSubcategoryID = C.ProductCategoryID
WHERE P.MakeFlag = 1



