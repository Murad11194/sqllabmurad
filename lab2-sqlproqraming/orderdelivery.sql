-- 1. October orders
SELECT OrderID, CustomerID, OrderDate, ShipDate, OrderStatus 
FROM Orders 
WHERE OrderDate BETWEEN '2026-10-01' AND '2026-10-31';

-- 2. Pending queue
SELECT * FROM Orders 
WHERE OrderStatus = 'Pending' 
ORDER BY OrderDate ASC;

-- 3. Late shipments
SELECT o.OrderID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderDate, o.ShipDate 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE o.ShipDate > DATE_ADD(o.OrderDate, INTERVAL 7 DAY);

-- 4. Affected customers
SELECT DISTINCT c.FirstName, c.LastName, c.Country 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE o.ShipDate > DATE_ADD(o.OrderDate, INTERVAL 7 DAY);

-- 5. Status correction
UPDATE Orders SET OrderStatus = 'Shipped', ShipDate = '2026-11-05' WHERE OrderID = 105;

-- 6. Address correction
UPDATE Orders SET ShipAddress = '45 Main Street, Baku' WHERE OrderID = 110;

-- 7. Remove test data
DELETE FROM Orders WHERE OrderID = 999;

-- 8. Status distribution
SELECT OrderStatus, COUNT(*) AS OrderCount 
FROM Orders 
GROUP BY OrderStatus;

-- 9. Unshipped orders
SELECT o.OrderID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderDate, o.OrderStatus 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE o.ShipDate IS NULL;