-- 1. Affordable products
SELECT Product, Category, Price 
FROM Products 
WHERE Price BETWEEN 50 AND 300 
ORDER BY Price ASC;

-- 2. Premium electronics
SELECT Product, Price 
FROM Products 
WHERE Category = 'Electronics' AND Price > 500;

-- 3. Product sales
SELECT p.Product, p.Category, o.Quantity, o.Sales 
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;

-- 4. Best-selling products
SELECT p.Product, SUM(o.Quantity) AS TotalQuantity 
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID 
GROUP BY p.ProductID, p.Product 
ORDER BY TotalQuantity DESC 
LIMIT 5;

-- 5. Unsold items
SELECT * FROM Products 
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM Orders);

-- 6. Employee performance
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, e.Department, SUM(o.Sales) AS TotalSales 
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.SalesPersonID 
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Department;

-- 7. Top-performing staff
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, SUM(o.Sales) AS TotalSales 
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.SalesPersonID 
GROUP BY e.EmployeeID, e.FirstName, e.LastName 
HAVING SUM(o.Sales) > 5000 
ORDER BY TotalSales DESC;

-- 8. New product
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (501, 'Wireless Keyboard', 'Electronics', 75.00);

-- 9. Price correction
UPDATE Products SET Price = 90.00 WHERE ProductID = 501;

-- 10. Inventory column
ALTER TABLE Products ADD COLUMN StockQuantity INT;

-- 11. Combined directory
SELECT FirstName, LastName FROM Customers
UNION
SELECT FirstName, LastName FROM Employees;

-- 12. Category performance
SELECT p.Category, SUM(o.Quantity) AS TotalQuantity, SUM(o.Sales) AS TotalSales 
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID 
GROUP BY p.Category 
HAVING SUM(o.Sales) > 2000 
ORDER BY TotalSales DESC;