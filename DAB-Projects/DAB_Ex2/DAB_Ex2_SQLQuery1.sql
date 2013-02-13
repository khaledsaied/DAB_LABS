-- Opgave 1
SELECT * FROM Customers;
-- Opgave 2
SELECT LastName,FirstName,BirthDate,City,Country FROM Employees;
-- Opgave 3
SELECT Country FROM Employees GROUP BY Country;
-- Opgave 4
SELECT * FROM Customers WHERE Country IN ('UK'); 
-- Opgave 5
SELECT * FROM [Order Details] WHERE Quantity>9 AND Quantity<21;  
SELECT * FROM [Order Details] WHERE Quantity between 10 and 20;
-- Opgave 6
SELECT LastName,FirstName,BirthDate,City,Country,Title FROM Employees WHERE Title LIKE '%Sales%';
-- Opgave 7
SELECT CustomerID,CompanyName,City,PostalCode FROM Customers WHERE City IN ('London') ORDER BY PostalCode;
-- Opgave 8
SELECT * FROM Customers WHERE Country IN('USA','Spain') AND ContactTitle='Marketing Manager' ORDER BY CompanyName DESC;
-- Opgave 9
SELECT * FROM Customers WHERE Country IN('UK','USA','Spain') AND Fax IS NULL;
-- Opgave 10
SELECT COUNT(*) FROM Customers;
-- Opgave 11
SELECT UnitPrice FROM [Order Details];
SELECT MIN(UnitPrice),MAX(UnitPrice),AVG(UnitPrice) FROM [Order Details];   
-- Opgave 12
SELECT SUM(Quantity) FROM [Order Details];
-- Opgave 13
SELECT * FROM Orders;
SELECT OrderID,OrderDate FROM Orders WHERE YEAR(OrderDate)=1996 AND MONTH(OrderDate)=07;
-- Opgave 14
SELECT Country AS 'Land', COUNT(CustomerID) AS 'Antal Kunder i Landet' FROM Customers GROUP BY Country;
-- Opgave 15
SELECT Country AS 'Land', COUNT(CustomerID) AS 'Antal Kunder i Landet' FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 2;
-- Opgave 16
SELECT FirstName,LastName,City,EmployeeID FROM Employees WHERE EmployeeID IN(SELECT EmployeeID FROM Orders WHERE YEAR(OrderDate)=1996 AND MONTH(OrderDate)=07);
-- Opgave 17
SELECT OrderID,ShipCountry,ShippedDate, ContactName FROM Orders JOIN Customers ON ShipCountry=Country WHERE ShipCountry='Mexico'; 
-- Opgave 18
SELECT Customers.CustomerID,OrderDate FROM Orders JOIN Customers ON ShipCountry=Country 
WHERE ShipCountry='Mexico' AND YEAR(OrderDate)=1997 
ORDER BY Customers.CustomerID ASC,OrderDate DESC; 
-- Opgave 19
SELECT FirstName,LastName,Region FROM Employees JOIN Region ON Region='Southern';
-- Opgave 20