SELECT * FROM hic.ecommerceorders

-- Task 1.1 - Retrieve Orders by a Specific Customer
-- Retrieves all orders placed by a specified customer
SELECT *
FROM eCommerceOrders1
WHERE CustomerID = 'CUST0001'  -- Replace with the specific CustomerID you want to analyze
ORDER BY OrderDate ASC;

-- Task 1.2 - List Products in a Specific Category
-- Lists all products within the 'Electronics' category
SELECT ProductID, ProductName, Category, Price
FROM eCommerceOrders1
WHERE Category = 'Electronics';

-- Task 1.3: Retrieve Orders Between Two Dates
-- Retrieves orders placed between 'start_date' and 'end_date'
SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM eCommerceOrders1
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-01-31'  -- Replace with desired start and end dates
ORDER BY OrderDate DESC;


-- Task 1.4 - Identify High-Value Orders
-- Lists orders with a total amount greater than $1000
SELECT OrderID, CustomerID, TotalAmount
FROM eCommerceOrders1
WHERE TotalAmount > 1000
ORDER BY TotalAmount DESC;

-- Task 1.5 - List Orders by Status
-- Lists orders with specific statuses such as 'Shipped' and 'Delivered'
SELECT OrderID, OrderStatus, CustomerID
FROM eCommerceOrders1
WHERE OrderStatus IN ('Shipped', 'Delivered')
ORDER BY OrderStatus;

-- Task 1.6 - Count Orders per Category
-- Counts the total number of orders placed in each Category
SELECT Category, COUNT(OrderID) AS OrderCount
FROM eCommerceOrders1
GROUP BY Category
ORDER BY OrderCount DESC;

-- Task 1.7 - Calculate Total Sales for Each Product
-- Calculates total sales amount for each product based on quantity and price
SELECT ProductName, SUM(TotalAmount) AS TotalSales
FROM eCommerceOrders1
GROUP BY ProductName
ORDER BY TotalSales DESC;

-- Task 1.8 - Retrieve Top 5 Most Frequent Customers
-- Lists the top 5 customers with the highest number of orders
SELECT CustomerID, CustomerName, COUNT(OrderID) AS OrderCount
FROM eCommerceOrders1
GROUP BY CustomerID, CustomerName
ORDER BY OrderCount DESC
LIMIT 5;

-- Task 1.9 - Calculate Average Order Value
-- Calculates the average value of all orders
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM eCommerceOrders1;

-- Task 1.10 - List Customers with High Average Order Value
-- Identifies customers with an average order value above $500
SELECT CustomerID, CustomerName, AVG(TotalAmount) AS AverageOrderValue
FROM eCommerceOrders1
GROUP BY CustomerID, CustomerName
HAVING AverageOrderValue > 500
ORDER BY AverageOrderValue DESC;

-- Task 1.11 - Retrieve Total Sales by Month
-- Retrieves total sales for each month, grouped by month
SELECT MONTH(OrderDate) AS OrderMonth, SUM(TotalAmount) AS MonthlySales
FROM eCommerceOrders1
GROUP BY OrderMonth
ORDER BY OrderMonth;

-- Task 1.12 - Find Top 3 Products by Total Sales
-- Lists the top 3 products with the highest total sales
SELECT ProductID, ProductName, SUM(TotalAmount) AS TotalSales
FROM eCommerceOrders1
GROUP BY ProductID, ProductName
ORDER BY TotalSales DESC
LIMIT 3;


