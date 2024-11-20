-- Task 2 (changed)
/*
CUST0052	Gloria	King
CUST0077	William	Garcia
CUST0094	Joseph	Jones
*/

UPDATE customerdetails3 SET ShippingAddress = NULL WHERE ShippingAddress = '';

SELECT CustomerID, OrderID, OrderDate, TotalAmount
FROM eCommerceOrders3
WHERE TotalAmount > 500
  AND OrderDate >= DATE('2024-11-11' - INTERVAL 3 month)
  AND CustomerID IN ('CUST0052', 'CUST0077', 'CUST0094')
ORDER BY OrderDate DESC;

-- Task 3 (changed)
SELECT p.Category, DATE_FORMAT(e.OrderDate, '%Y-%m') AS `Month`, 
       SUM(e.TotalAmount) AS `Monthly Revenue`
FROM eCommerceOrders3 e 
LEFT JOIN productdetails3 p on e.ProductID = e.ProductID
GROUP BY p.Category, `Month`
ORDER BY p.Category, `Month`;

-- Task 4
SELECT e.OrderID, e.CustomerID, a.ShippingAddress
FROM eCommerceOrders3 e
LEFT JOIN CustomerDetails3 a ON e.CustomerID = a.CustomerID
WHERE a.ShippingAddress IS NULL
ORDER BY e.OrderID;

-- Task 5 (changed)
SELECT e.ProductID, p.Category, SUM(e.TotalAmount) AS `Total Sales`
FROM eCommerceOrders3 e 
LEFT JOIN productdetails3 p ON e.ProductID = p.ProductID
GROUP BY e.ProductID, p.Category
HAVING `Total Sales` > (
    SELECT AVG(`Category Average Sales`)
    FROM (
        SELECT p.Category, SUM(e.TotalAmount) / COUNT(DISTINCT p.ProductID) AS `Category Average Sales`
        FROM eCommerceOrders3 e
        LEFT JOIN productdetails3 p ON e.ProductID = p.ProductID
        GROUP BY p.Category
    ) AS category_averages
    WHERE category_averages.Category = p.Category
)
ORDER BY `Total Sales` DESC;


-- Task 6
SELECT ProductID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS `Running Total`
FROM eCommerceOrders3
ORDER BY ProductID, OrderDate;

-- Task 7
SELECT CustomerID,
       SUM(TotalAmount) AS `Total Spending`,
       CASE
           WHEN SUM(TotalAmount) < 500 THEN 'Low'
           WHEN SUM(TotalAmount) BETWEEN 500 AND 2000 THEN 'Medium'
           ELSE 'High'
       END AS `Spending Tier`
FROM eCommerceOrders3
GROUP BY CustomerID
ORDER BY `Total Spending` DESC;

-- Task 8
SELECT CustomerID, Email
FROM CustomerDetails3
WHERE Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com'
ORDER BY CustomerID;

-- Task 9 (changed)
SELECT CustomerID FROM CustomerDetails3
EXCEPT
SELECT DISTINCT CustomerID
FROM eCommerceOrders3
WHERE OrderDate >= DATE('2024-11-11' - INTERVAL 3 month)
ORDER BY CustomerID;

-- Task 10
CREATE VIEW HighValueOrders AS
SELECT OrderID, CustomerID, TotalAmount
FROM eCommerceOrders3
WHERE TotalAmount > 500;

