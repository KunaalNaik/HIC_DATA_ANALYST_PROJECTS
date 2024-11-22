

-- Task 2
EXPLAIN ANALYZE
SELECT CustomerID, SUM(TotalAmount) AS "Total Spending"
FROM eCommerceOrders3
GROUP BY CustomerID;

-- Adding an index on CustomerID for optimization
CREATE INDEX idx_customer_id ON eCommerceOrders3(CustomerID);

-- Task 3 (changed)
SELECT c.CustomerID, c.CustomerFirstName, o.OrderID, p.ProductName, o.Quantity, o.TotalAmount
FROM eCommerceOrders3 o
JOIN CustomerDetails3 c ON o.CustomerID = c.CustomerID
JOIN ProductDetails3 p ON o.ProductID = p.ProductID
ORDER BY c.CustomerID, o.OrderID

-- Task 4
EXPLAIN ANALYZE
SELECT OrderID, OrderDate, TotalAmount
FROM eCommerceOrders3
WHERE OrderDate > '2024-01-01';

-- Adding indexes for optimization
CREATE INDEX idx_order_date ON eCommerceOrders3(OrderDate);
CREATE INDEX idx_total_amount ON eCommerceOrders3(TotalAmount);

-- Task 5  (changed)
CREATE TEMPORARY TABLE ProductSales3 AS
SELECT ProductID, SUM(TotalAmount) AS total_sales
FROM eCommerceOrders3
GROUP BY ProductID;

-- Retrieve products with sales above $10,000
SELECT ProductID, total_sales
FROM ProductSales3
WHERE total_sales > 1000
ORDER BY total_sales DESC;

-- Task 6 (changed)
SELECT ProductID, Sales_Month, Sales
FROM (
    SELECT ProductID, 'January' AS Sales_Month, Month_Jan AS Sales FROM Monthly_Sales
    UNION ALL
    SELECT ProductID, 'February' as Sales_Month, Month_Feb FROM Monthly_Sales
    UNION ALL
    SELECT ProductID, 'March' as Sales_Month, Month_Mar FROM Monthly_Sales
    UNION ALL
    SELECT ProductID, 'April' as Sales_Month, Month_Mar FROM Monthly_Sales
    UNION ALL
    SELECT ProductID, 'May' as Sales_Month, Month_Mar FROM Monthly_Sales
    UNION ALL
    SELECT ProductID, 'June' as Sales_Month, Month_Mar FROM Monthly_Sales
    -- Add additional months as needed
) AS UnpivotedSales
ORDER BY ProductID, Sales_Month

-- Task 7
SELECT AVG(Revenue) AS "Average Revenue",
       VARIANCE(Revenue) AS "Revenue Variance",
       STDDEV(Revenue) AS "Revenue Standard Deviation"
FROM Monthly_Revenue

-- Task 8
SELECT Category, Month, Revenue,
       Revenue - LAG(Revenue, 1) OVER (PARTITION BY Category ORDER BY Month) AS "MoM Change"
FROM Monthly_Revenue
ORDER BY Category, Month


-- Task 9 (changed)
DROP TABLE YearlyRevenueSummary
CREATE TABLE YearlyRevenueSummary AS
SELECT YEAR(e.OrderDate) AS `Year`, 
       p.Category, 
       SUM(e.TotalAmount) AS `Yearly Revenue`
FROM eCommerceOrders3 e
LEFT JOIN productdetails3 p ON e.ProductID = p.ProductID
GROUP BY YEAR(e.OrderDate), p.Category;
