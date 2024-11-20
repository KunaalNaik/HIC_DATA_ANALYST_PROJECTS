

-- Task 2
SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM eCommerceOrders3
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY OrderDate ASC;


-- Task 3
SELECT OrderID, OrderStatus, CustomerID
FROM eCommerceOrders3
WHERE OrderStatus IN ('Shipped', 'Delivered')
ORDER BY OrderStatus;

-- Task 4
SELECT CustomerID, OrderID, TotalAmount
FROM eCommerceOrders3
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM eCommerceOrders3)
ORDER BY TotalAmount DESC;

-- Task 5 (changed)
SELECT p.Category, AVG(p.Price) AS `Average Price`
FROM eCommerceOrders3 e
LEFT JOIN productdetails3 p on e.ProductID = p.ProductID
GROUP BY p.Category
HAVING AVG(p.Price) > 100
ORDER BY `Average Price` DESC;

-- Task 6 (changed )
SELECT p.Category, e.ProductID, p.ProductName, e.Quantity,
       RANK() OVER (PARTITION BY Category ORDER BY Quantity DESC) AS `Popularity Rank`
FROM eCommerceOrders3 e
LEFT JOIN productdetails3 p on e.ProductID = p.ProductID
ORDER BY p.Category, `Popularity Rank`;

-- Task 7
SELECT ProductID FROM ProductDetails3
EXCEPT
SELECT DISTINCT ProductID FROM eCommerceOrders3;

-- Task 8 
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS `Order Month`,
       COUNT(CASE WHEN TotalAmount > 500 THEN 1 END) AS `High Value Orders`
FROM eCommerceOrders3
GROUP BY `Order Month`
ORDER BY `Order Month`;

-- Task 9
SELECT CustomerID, Email
FROM CustomerDetails3
WHERE Email LIKE '%@gmail.com'
ORDER BY CustomerID;

-- Task 10
SELECT OrderID, OrderDate, ShippingDate,
       DATEDIFF(ShippingDate, OrderDate) AS `Processing Days`
FROM eCommerceOrders3
WHERE ShippingDate IS NOT NULL
ORDER BY OrderDate;


-- Task 11
SELECT p.Category, e.ProductID, SUM(TotalAmount) AS `Total Sales`
FROM eCommerceOrders3 e
LEFT JOIN productdetails3 p on e.ProductID = p.ProductID
GROUP BY p.Category, e.ProductID WITH ROLLUP
ORDER BY p.Category, e.ProductID;











