-- Customers Table
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    CreatedAt TIMESTAMP DEFAULT NOW()
);

-- Products Table
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Orders Table
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate TIMESTAMP DEFAULT NOW(),
    TotalAmount DECIMAL(10, 2)
);

-- OrderDetails Table (Many-to-Many relationship between Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2)
);

-- Categories Table (for hierarchical product categories)
CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(50),
    ParentCategoryID INT REFERENCES Categories(CategoryID)
);
