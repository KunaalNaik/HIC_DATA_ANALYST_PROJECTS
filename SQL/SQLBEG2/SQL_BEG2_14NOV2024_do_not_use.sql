SELECT * FROM hic.ecommerceorders

-- Task 1.1 - Calculate Total Quantity Sold per Product
SELECT ProductName, SUM(Quantity) AS TotalQuantitySold
FROM eCommerceOrders2
GROUP BY ProductName
ORDER BY TotalQuantitySold DESC;

-- Task 1.2 - List Customers with Orders in a Specific Date Range
SELECT CustomerID, CustomerName, OrderID, OrderDate
FROM eCommerceOrders2
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-01-31'  -- Replace with desired start and end dates
ORDER BY CustomerName;

-- Task 1.3 - Identify Orders with Missing Customer Information
SELECT OrderID, CustomerID, CustomerName, OrderDate
FROM eCommerceOrders2
WHERE CustomerID IS NULL OR CustomerName IS NULL;

-- Task 1.4 - Calculate Total Sales by Payment Method
SELECT PaymentMethod, SUM(TotalAmount) AS TotalSales
FROM eCommerceOrders2
GROUP BY PaymentMethod
ORDER BY TotalSales DESC;

-- Task 1.5 - Find Average Quantity per Order
SELECT AVG(Quantity) AS AverageQuantityPerOrder
FROM eCommerceOrders2;

-- Task 1.6 - List Customers with Orders Above Average Total Amount
SELECT CustomerID, CustomerName, OrderID, TotalAmount
FROM eCommerceOrders2
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM eCommerceOrders);

-- Task 1.7 - Calculate Percentage of Orders by Status
SELECT OrderStatus, 
       COUNT(OrderID) * 100.0 / (SELECT COUNT(*) FROM eCommerceOrders) AS Percentage
FROM eCommerceOrders2
GROUP BY OrderStatus;

-- Task 1.8 - Identify Top 3 Categories by Total Sales
SELECT Category, SUM(TotalAmount) AS TotalSales
FROM eCommerceOrders2
GROUP BY Category
ORDER BY TotalSales DESC
LIMIT 3;

-- Task 1.9 - Count Unique Products Ordered by Each Customer
SELECT CustomerID, COUNT(DISTINCT ProductID) AS UniqueProductsOrdered
FROM eCommerceOrders2
GROUP BY CustomerID;

-- Task 1.10 - List Orders with Quantity Greater than Average
SELECT OrderID, CustomerID, ProductName, Quantity
FROM eCommerceOrders2
WHERE Quantity > (SELECT AVG(Quantity) FROM eCommerceOrders);

-- Task 1.11 - Retrieve Products Not Ordered in a Specific Month
SELECT ProductID, ProductName
FROM eCommerceOrders2
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM eCommerceOrders
    WHERE MONTH(OrderDate) = 1  -- Replace '1' with the desired month number (e.g., 1 for January)
);

-- Task 1.12 - Calculate Total Revenue and Average Quantity by Customer
SELECT CustomerID, CustomerName, 
       SUM(TotalAmount) AS TotalRevenue, 
       AVG(Quantity) AS AverageQuantity
FROM eCommerceOrders2
GROUP BY CustomerID, CustomerName;

-- Task 1.13 - Identify Customers Who Purchased in Consecutive Months
SELECT CustomerID, YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth
FROM eCommerceOrders2
GROUP BY CustomerID, OrderYear, OrderMonth
HAVING COUNT(DISTINCT MONTH(OrderDate)) > 1
ORDER BY CustomerID, OrderYear, OrderMonth;

-- Task 1.14 - Retrieve Most Common Order Quantity
SELECT Quantity, COUNT(*) AS Frequency
FROM eCommerceOrders2
GROUP BY Quantity
ORDER BY Frequency DESC
LIMIT 1;



