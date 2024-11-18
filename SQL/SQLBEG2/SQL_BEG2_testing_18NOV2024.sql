SELECT * FROM hic.ecommerceorders

-- to include nulls
UPDATE eCommerceOrders2 SET CustomerID = NULL WHERE CustomerID = '';
UPDATE eCommerceOrders2 SET ShippingAddress = NULL WHERE ShippingAddress = '';

-- Task 1.2
SELECT CustomerID AS ID, OrderID AS `Order Number`, OrderDate AS `Order Date`, TotalAmount AS `Total Price`
FROM eCommerceOrders2
ORDER BY OrderDate ASC;

-- Task 1.3
SELECT OrderID, TotalAmount, 
       TotalAmount * 0.9 AS `Discounted Price`
FROM eCommerceOrders2
ORDER BY TotalAmount DESC;

-- Task 1.4
SELECT OrderID, COALESCE(ShippingAddress, 'Pending') AS `Shipecommerceorders2ping Address`
FROM eCommerceOrders2
WHERE ShippingAddress IS NULL;

-- Task 1.5
SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 500 THEN 'High Value'
           ELSE 'Regular'
       END AS `Order Type`
FROM eCommerceOrders2;

-- Task 1.6 
SELECT CustomerID, CONCAT(CustomerFirstName, ' ', CustomerLastName) AS `Full Name`
FROM CustomerDetails2;

-- Task 1.7 
SELECT OrderID, OrderDate, 
       MONTH(OrderDate) AS `Order Month`
FROM eCommerceOrders2;

-- Task 1.8
SELECT e.OrderID, e.CustomerID, CONCAT(c.CustomerFirstName, ' ', c.CustomerLastName) AS `Full Name`, e.OrderDate, e.TotalAmount
FROM eCommerceOrders2 e
JOIN CustomerDetails2 c ON e.CustomerID = c.CustomerID
ORDER BY e.OrderDate ASC;

-- Task 1.9
SELECT OrderID, OrderDate, OrderStatus
FROM eCommerceOrders2
WHERE OrderStatus = 'Delivered'
UNION
SELECT OrderID, OrderDate, OrderStatus
FROM eCommerceOrders2
WHERE OrderStatus = 'Shipped'
ORDER BY OrderDate ASC;

-- Task 10
SELECT OrderID, OrderDate, Quantity, TotalAmount
FROM eCommerceOrders2
ORDER BY Quantity DESC, OrderDate DESC
LIMIT 10;

-- Task 1.11
SELECT Category, SUM(TotalAmount) AS `Total Sales`
FROM eCommerceOrders2
GROUP BY Category
HAVING SUM(TotalAmount) > 10000
ORDER BY `Total Sales` DESC;

-- Task 1.12
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS `Order Month`, COUNT(OrderID) AS `Order Count`
FROM eCommerceOrders2
GROUP BY `Order Month`
ORDER BY `Order Month` ASC;

-- Task 13 
SELECT PaymentMethod, AVG(TotalAmount) AS `Average Order Value`
FROM eCommerceOrders2
GROUP BY PaymentMethod
ORDER BY `Average Order Value` DESC;

-- Task 1.14 
SELECT OrderStatus, COUNT(OrderID) AS `Order Count`
FROM eCommerceOrders2
GROUP BY OrderStatus
ORDER BY `Order Count` DESC;

-- Task 1.15
SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SELECT CustomerID, OrderID, MAX(Quantity) AS `Highest Quantity`
FROM eCommerceOrders2
GROUP BY CustomerID
ORDER BY `Highest Quantity` DESC;

-- Task 1.16
SELECT YEAR(OrderDate) AS OrderYear, SUM(TotalAmount) AS TotalRevenue
FROM eCommerceOrders2
GROUP BY OrderYear
ORDER BY OrderYear ASC;

-- Task 1.17
SELECT City, COUNT(DISTINCT CustomerID) AS `Unique Customers`
FROM CustomerDetails2
GROUP BY City
ORDER BY `Unique Customers` DESC;

-- Task 1.8
SELECT CustomerID, SUM(TotalAmount) AS `Total Spending`
FROM eCommerceOrders2
GROUP BY CustomerID
ORDER BY `Total Spending` DESC
LIMIT 5;



