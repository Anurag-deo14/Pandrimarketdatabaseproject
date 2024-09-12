-- Insert into Customers
INSERT INTO Customers (CustomerName, Email, Country, City) 
VALUES 
('John Doe', 'john.doe@email.com', 'USA', 'New York'),
('Jane Smith', 'jane.smith@email.com', 'UK', 'London'),
('Ravi Kumar', 'ravi.kumar@email.com', 'India', 'Mumbai');

-- Insert into Products
INSERT INTO Products (ProductName, Category, Price, Stock)
VALUES 
('Laptop', 'Electronics', 1500.00, 100),
('Smartphone', 'Electronics', 800.00, 200),
('T-shirt', 'Clothing', 20.00, 500);

-- Insert into Orders
INSERT INTO Orders (CustomerID, TotalAmount) VALUES (1, 1500.00);

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice, TotalPrice)
VALUES 
(1, 1, 1, 1500.00, 1500.00);
