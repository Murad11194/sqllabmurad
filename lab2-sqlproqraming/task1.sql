
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Score INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    BirthDate DATE,
    Gender VARCHAR(10),
    Salary DECIMAL(10,2),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SalesPersonID INT,
    OrderDate DATE,
    ShipDate DATE,
    OrderStatus VARCHAR(30),
    ShipAddress VARCHAR(150),
    BillAddress VARCHAR(150),
    Quantity INT,
    Sales DECIMAL(10,2),
    CreationTime DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES
(1, 'Ayla', 'Karimova', 'Azerbaijan', 720),
(2, 'John', 'Miller', 'USA', 450),
(3, 'Emma', 'Schmidt', 'Germany', 860),
(4, 'Sara', 'Martin', 'France', 280),
(5, 'Lukas', 'Weber', 'Germany', 550);


INSERT INTO Products (ProductID, Product, Category, Price) VALUES
(101, 'Wireless Mouse', 'Electronics', 55.00),
(102, 'Office Chair', 'Furniture', 230.00),
(103, 'Laptop', 'Electronics', 850.00),
(104, 'Notebook', 'Stationery', 12.00),
(105, 'Smart Phone', 'Electronics', 420.00);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES
(11, 'David', 'Lee', 'Sales', '1990-05-12', 'Male', 2200.00, NULL),
(12, 'Maya', 'Brown', 'Sales', '1992-08-20', 'Female', 2400.00, NULL),
(13, 'Alex', 'Green', 'Support', '1988-11-05', 'Male', 1900.00, NULL);


INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES
(201, 101, 1, 11, '2026-10-04', '2026-10-06', 'Delivered', 'Baku, Nizami st. 5', 'Baku, Nizami st. 5', 2, 110.00, '2026-10-04 10:00:00'),
(202, 103, 3, 12, '2026-10-08', '2026-10-10', 'Shipped', 'Berlin, Hauptstr. 12', 'Berlin, Hauptstr. 12', 1, 850.00, '2026-10-08 11:30:00'),
(203, 102, 2, 11, '2026-10-12', NULL, 'Pending', 'New York, 5th Ave 20', 'New York, 5th Ave 20', 1, 230.00, '2026-10-12 14:15:00'),
(204, 105, 5, 12, '2026-10-15', '2026-10-17', 'Delivered', 'Munich, Karlsplatz 3', 'Munich, Karlsplatz 3', 1, 420.00, '2026-10-15 09:45:00');