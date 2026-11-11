-- 1. High-score customers
SELECT FirstName, LastName, Country, Score 
FROM Customers 
WHERE Score > 500 
ORDER BY Score DESC;

-- 2. Target countries
SELECT FirstName, LastName, Country, Score 
FROM Customers 
WHERE Country IN ('Germany', 'France', 'USA') AND Score >= 300;

-- 3. Purchase history
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID, o.OrderDate, o.Sales 
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 4. Inactive customers
SELECT CustomerID, FirstName, LastName, Country 
FROM Customers 
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

-- 5. Total customer spending
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, SUM(o.Sales) AS TotalSales 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
ORDER BY TotalSales DESC;

-- 6. Loyalty threshold
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, SUM(o.Sales) AS TotalSales 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(o.Sales) > 1000;

-- 7. Top-five report
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.Country, SUM(o.Sales) AS TotalSales 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Country 
ORDER BY TotalSales DESC 
LIMIT 5;