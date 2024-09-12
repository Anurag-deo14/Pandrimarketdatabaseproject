-- Indexing
CREATE INDEX idx_customers_customerid ON Customers(CustomerID);
CREATE INDEX idx_orders_orderdate ON Orders(OrderDate);
CREATE INDEX idx_products_category ON Products(Category);

-- Materialized View for Reporting
CREATE MATERIALIZED VIEW SalesReport AS
SELECT 
    c.CustomerName,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity,
    SUM(od.TotalPrice) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerName, p.ProductName;
