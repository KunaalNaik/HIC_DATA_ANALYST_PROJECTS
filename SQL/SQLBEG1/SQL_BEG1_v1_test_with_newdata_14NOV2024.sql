
-- Change Customer to Caleb Clark
SELECT CustomerID, CustomerName, OrderID, OrderDate, TotalAmount
FROM eCommerceOrders1
WHERE CustomerID = 'CUST0043'
ORDER BY OrderDate ASC


SELECT ProductID, ProductName, Category, Price
FROM eCommerceOrders1
WHERE Category = 'Electronics'
ORDER BY ProductName ASC

SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM eCommerceOrders1
WHERE OrderDate >= Date('2024-10-01') and OrderDate <= Date('2024-10-31')
ORDER BY OrderDate DESC;


SELECT CustomerID, CustomerName, OrderID, TotalAmount
FROM eCommerceOrders1
WHERE TotalAmount > 500
ORDER BY TotalAmount DESC


SELECT ProductID, ProductName, SUM(Quantity) as TotalQuantity
FROM eCommerceOrders1
GROUP BY ProductID, ProductName
ORDER BY TotalQuantity DESC
LIMIT 5