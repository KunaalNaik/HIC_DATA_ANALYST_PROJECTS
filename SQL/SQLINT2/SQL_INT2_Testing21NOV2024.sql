

-- Task 2
SELECT e.CustomerID, e.ProductID, p.Category, e.Quantity
FROM eCommerceOrders e
LEFT JOIN productdetails p on e.ProductID = p.ProductID
WHERE e.Quantity = (
    SELECT MAX(e.Quantity)
    FROM eCommerceOrders e
    LEFT JOIN productdetails p on e.ProductID = p.ProductID
    WHERE p.Category = p.Category
)
ORDER BY p.Category, e.Quantity DESC;

-- Task 3
SELECT CustomerID, OrderID, TotalAmount,
       ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY TotalAmount DESC) AS "Order Rank"
FROM eCommerceOrders
ORDER BY CustomerID, "Order Rank";

-- Task 4
SELECT 
    SUM(CASE WHEN p.Category = 'Electronics' THEN e.TotalAmount ELSE 0 END) AS "Electronics Sales",
    SUM(CASE WHEN p.Category = 'Clothing' THEN e.TotalAmount ELSE 0 END) AS "Clothing Sales",
    SUM(CASE WHEN p.Category = 'Home Appliances' THEN e.TotalAmount ELSE 0 END) AS "Home Appliances Sales"
FROM eCommerceOrders e
LEFT JOIN productdetails p on e.ProductID = p.ProductID;

-- Task 5
WITH RECURSIVE CategoryHierarchy AS (
    SELECT CategoryID, ParentCategoryID, CategoryName, 1 AS Level
    FROM Categories
    WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT c.CategoryID, c.ParentCategoryID, c.CategoryName, ch.Level + 1
    FROM Categories c
    JOIN CategoryHierarchy ch ON c.ParentCategoryID = ch.CategoryID
)
SELECT * FROM CategoryHierarchy3
ORDER BY Level, CategoryID;

-- Task 6
SELECT CustomerID, JSON_EXTRACT(Preferences, '$.preferredCategory') AS "Preferred Category"
FROM CustomerDetails_i3p
WHERE JSON_EXTRACT(Preferences, '$.preferredCategory') IS NOT NULL;

-- Task 7
SELECT e.OrderID, e.Quantity, p.Price, e.TotalAmount
FROM eCommerceOrders e
LEFT JOIN productdetails p on e.ProductID = p.ProductID;
WHERE e.Quantity * p.Price <> e.TotalAmount;

-- Task 8
SELECT CustomerID, Email
FROM CustomerDetails_i3p
WHERE Email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' OR Email NOT LIKE '%.com';


-- Task 9
START TRANSACTION;

UPDATE Inventory i
JOIN eCommerceOrders e ON i.ProductID = e.ProductID
SET i.StockQuantity = i.StockQuantity - e.Quantity
WHERE e.OrderID = 'ORD0000005';

-- Check for errors and rollback if any
-- Since MySQL doesn't support @@ERROR directly, this part might need application logic

UPDATE eCommerceOrders
SET OrderStatus = 'Completed'
WHERE OrderID = 'ORD0000005';

COMMIT;