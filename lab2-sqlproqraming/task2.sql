-- Task 1: Explore a table
SELECT * FROM Customers;
SELECT FirstName, LastName, Country FROM Customers;

-- Task 2: Filter by country
SELECT CustomerID, FirstName, LastName, Country 
FROM Customers 
WHERE Country = 'Germany';

-- Task 3: Combine conditions
SELECT CustomerID, FirstName, LastName, Country, Score 
FROM Customers 
WHERE Score >= 300 AND Country IN ('Germany', 'France');

-- Task 4: Sort products
SELECT ProductID, Product, Category, Price 
FROM Products 
ORDER BY Price DESC;

-- Task 5: Search within a range
SELECT Product, Price 
FROM Products 
WHERE Price BETWEEN 50 AND 300;

-- Task 6: Search text patterns
SELECT Product, Category 
FROM Products 
WHERE Product LIKE '%Phone%';

-- Task 7: Find distinct values
SELECT DISTINCT Category 
FROM Products 
ORDER BY Category ASC;

-- Task 8: Connect customer orders
SELECT o.OrderID, c.FirstName, c.LastName 
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Task 9: Summarize orders
SELECT OrderStatus, COUNT(*) AS OrderCount, SUM(Sales) AS TotalSales 
FROM Orders 
GROUP BY OrderStatus 
ORDER BY TotalSales DESC;

-- Task 10: Make a safe data change
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (501, 'Test Item', 'Accessories', 40.00);
UPDATE Products SET Price = 45.00 WHERE ProductID = 501;
SELECT * FROM Products WHERE ProductID = 501;
DELETE FROM Products WHERE ProductID = 501;
-- Niyə WHERE vacibdir? Çünki WHERE şərti olmasa, UPDATE bütün cədvəldəki qiymətləri dəyişər, DELETE isə bütün cədvəldəki sətirləri silər.