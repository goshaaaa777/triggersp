USE Northwind

Create table HistorialEliminacion
(	Codigo int identity(1,1) primary key,
	Fecha date,
	Accion varchar(100),
	Usuario varchar(100)
)
/*Cuando Se elimine un cliente que registre
el la eliminacion en HistorialElâminacion*/
CREATE TRIGGER Tr_Delete_Customers
ON Customers for delete
AS	
BEGIN 
INSERT INTO [Customers_Deleted] 
SELECT * FROM deleted	
END
GO
----------------------------------------------------------------------------------------------------
SELECT * FROM [Customers_Deleted] 
	SELECT * FROM Customers
GO

	DELETE FROM Customers WHERE CustomerID='ABDC3'
	SELECT * FROM Products WHERE ProductID=15
	SELECT * FROM [Order Details] where OrderID='10249'
	DELETE FROM [Order Details] WHERE OrderID=10249 AND ProductID=15

	
INSERT INTO [Order Details] (OrderID,ProductID,Quantity,Discount)VALUES
(10249,15,10,0)

-----------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_Orders
ON [Order Details] FOR INSERT
AS 
BEGIN
	UPDATE D SET D.UNITPRICE = P.UNITPRICE
	FROM [Order Details]AS D INNER JOIN Products AS P ON D.PRODUCTID=P.PRODUCTID
	INNER JOIN INSERTED AS I ON I.ORDERID=D.ORDERID AND I.PRODUCTID=D.PRODUCTID
	END

----------------------Manejo de inventarios con triggers-------------------------
CREATE TRIGGER TR_Debit_Stock
ON [Order Details] FOR INSERT
AS 
BEGIN
	UPDATE p SET p.UnitsInStock=p.UnitsInStock - i.quantity
	FROM inserted AS i inner join Products AS p on i.ProductID=p.ProductID
END
GO

---------------------------------------------------------------------------------
CREATE TRIGGER TR_credit_Stock
ON [Order Details] FOR DELETE
AS 
BEGIN
	UPDATE p SET p.UnitsInStock=p.UnitsInStock + i.quantity
	FROM deleted AS i inner join Products AS p on i.ProductID=p.ProductID
END
GO