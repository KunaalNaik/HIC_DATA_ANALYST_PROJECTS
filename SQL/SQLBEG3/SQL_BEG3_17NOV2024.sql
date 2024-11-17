

SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM ecommerceorders_sql3
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY OrderDate ASC;

-- Changed
SELECT OrderID, OrderStatus, CustomerID
FROM ecommerceorders_sql3
WHERE OrderStatus IN ('Shipped', 'Delivered')
ORDER BY OrderStatus;

SELECT CustomerID, OrderID, TotalAmount
FROM ecommerceorders_sql3
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM ecommerceorders_sql3)
ORDER BY TotalAmount DESC;

-- Changed to Join
SELECT b.Category, AVG(b.Price) AS `Average Price`
FROM ecommerceorders_sql3 a
LEFT JOIN productdetails_sql3 b on a.ProductID = b.ProductID
GROUP BY b.Category
HAVING AVG(b.Price) > 100
ORDER BY `Average Price` DESC;

-- Changed to Join
SELECT b.Category, b.ProductID, b.ProductName, a.Quantity,
       RANK() OVER (PARTITION BY b.Category ORDER BY a.Quantity DESC) AS `Popularity Rank`
FROM ecommerceorders_sql3 a
LEFT JOIN productdetails_sql3 b on a.ProductID = b.ProductID
ORDER BY b.Category, `Popularity Rank`;

SELECT ProductID FROM productdetails_sql3
EXCEPT
SELECT DISTINCT ProductID FROM ecommerceorders_sql3;

SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS `Order Month`,
       COUNT(CASE WHEN TotalAmount > 500 THEN 1 END) AS `High Value Orders`
FROM ecommerceorders_sql3
GROUP BY `Order Month`
ORDER BY `Order Month`;

SELECT CustomerID, Email
FROM CustomerDetails_sql3
WHERE Email LIKE '%@gmail.com'
ORDER BY CustomerID;


SELECT OrderID, OrderDate, ShippingDate,
       DATEDIFF(ShippingDate, OrderDate) AS `Processing Days`
FROM ecommerceorders_sql3
WHERE ShippingDate IS NOT NULL
ORDER BY OrderDate;

SELECT b.Category, a.ProductID, SUM(a.TotalAmount) AS `Total Sales`
FROM ecommerceorders_sql3 a
LEFT JOIN productdetails_sql3 b on a.ProductID = b.ProductID
GROUP BY b.Category, a.ProductID WITH ROLLUP
ORDER BY b.Category, a.ProductID;