-- 1. Customer Lifetime Value (LTV) Calculation
SELECT 
    CustomerID,
    CustomerName,
    SUM(TotalAmount) OVER(PARTITION BY CustomerID) AS LifetimeValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 2. Top Selling Products
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSold,
    SUM(od.TotalPrice) AS TotalRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 5;

-- 3. Geographical Sales Breakdown
SELECT 
    c.Country,
    SUM(o.TotalAmount) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Country
ORDER BY TotalSales DESC;

-- 4. Rolling Sales Calculation (Moving Average)
SELECT 
    OrderDate,
    SUM(TotalAmount) OVER(
        ORDER BY OrderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS ThreeMonthMovingAvg
FROM Orders;

-- 5. Customer Segmentation: Ranking by Total Spending
SELECT 
    CustomerID,
    CustomerName,
    SUM(TotalAmount) AS TotalSpent,
    RANK() OVER(ORDER BY SUM(TotalAmount) DESC) AS CustomerRank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY CustomerID, CustomerName;

-- 6. Recursive Query for Hierarchical Product Categories
WITH RECURSIVE CategoryHierarchy AS (
    SELECT CategoryID, CategoryName, ParentCategoryID
    FROM Categories
    WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT c.CategoryID, c.CategoryName, c.ParentCategoryID
    FROM Categories c
    JOIN CategoryHierarchy ch ON c.ParentCategoryID = ch.CategoryID
)
SELECT * FROM CategoryHierarchy;

-- 7. Promotional Campaign Effectiveness
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSoldDuringPromo,
    SUM(CASE 
        WHEN o.OrderDate BETWEEN '2024-01-01' AND '2024-01-31' THEN od.TotalPrice
        ELSE 0 END) AS PromoSales
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductName;
