# SQL for Data Analysis: Beginner Level I - Practical SQL for Real-World eCommerce Analytics
This course is a hands-on SQL learning experience, designed to take learners from beginner to advanced SQL skills through real-world eCommerce data projects. Each project simulates essential business tasks such as customer analysis, sales trends, and inventory management, providing learners with practical skills they can directly apply in real-world data scenarios.

## Task Description for Jypyter Notebook
Here’s a description for each of the 12 tasks:

---

1. **Retrieve Orders by a Specific Customer**  
   This task helps in identifying all the orders placed by a particular customer, which is useful for analyzing customer purchasing behavior and supporting customer service follow-up.

2. **List Products in a Specific Category**  
   This task allows filtering of products within a specific category, which is useful for targeted marketing, inventory management, or understanding demand in specific categories.

3. **Retrieve Orders Between Two Dates**  
   This task helps in identifying orders placed within a defined date range, which is useful for analyzing seasonal trends or sales performance over a specific time period.

4. **Identify High-Value Orders**  
   This task focuses on finding high-value orders that exceed a specific amount, which can help in understanding spending patterns, identifying valuable customers, and targeting premium transactions.

5. **List Orders by Status**  
   This task allows filtering of orders by their processing status, such as 'Shipped' or 'Delivered', which is useful for monitoring order fulfillment stages and assessing operational efficiency.

6. **Count Orders per Category**  
   This task counts the total number of orders placed within each product category, which is useful for understanding category popularity and demand forecasting.

7. **Calculate Total Sales for Each Product**  
   This task calculates the total sales for each product, which is helpful in identifying top-performing products, making inventory decisions, and prioritizing marketing resources.

8. **Retrieve Top 5 Most Frequent Customers**  
   This task identifies the top 5 customers by order count, which is useful for targeting loyal customers with special offers or customer retention strategies.

9. **Calculate Average Order Value**  
   This task calculates the average value of all orders, which provides insights into customer spending patterns and helps in setting pricing strategies.

10. **List Customers with High Average Order Value**  
    This task identifies customers with an average order value above a specified threshold, which is useful for targeting high-spending customers for premium offers or loyalty programs.

11. **Retrieve Total Sales by Month**  
    This task aggregates total sales for each month, which helps in analyzing revenue distribution over time and identifying peak sales periods for better planning.

12. **Find Top 3 Products by Total Sales**  
    This task identifies the top 3 products with the highest total sales, which is useful for focusing inventory and marketing efforts on the best-selling items.

---

### **Task 1.1 - Retrieve Orders by a Specific Customer**

**Retrieve details of all orders placed by Henry Myers to gain insights into their purchasing frequency and preferences.**  
This information can help in crafting personalized offers or customer retention strategies.

**Instructions**:  
This task helps in identifying all the orders placed by a particular customer, useful for analyzing customer purchasing behavior and supporting customer service follow-up.

- **Columns to Use**: `CustomerID`, `CustomerName`, `OrderID`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `ORDER BY`.
- **Steps**:
  - Use the `SELECT` statement to retrieve columns relevant to customer and order details.
  - Filter the records by a specific `CustomerID`.
  - Sort by `OrderDate` for chronological order if needed.

**MySQL Code**:
```sql
-- Task 1.1 - Retrieve Orders by a Specific Customer
SELECT CustomerID, CustomerName, OrderID, OrderDate, TotalAmount
FROM eCommerceOrders
WHERE CustomerID = 'CUST0001'  -- Replace with specific CustomerID
ORDER BY OrderDate ASC;
```

---

### **Task 1.2 - List Products in a Specific Category**

**List all products in the 'Electronics' category to identify inventory items within that category.**  
This data is useful for targeted marketing, inventory management, or understanding demand in specific categories.

**Instructions**:  
This task helps to filter products within a specific category for deeper category-based analysis.

- **Columns to Use**: `ProductID`, `ProductName`, `Category`, `Price`.
- **Commands to Use**: `SELECT`, `WHERE`.
- **Steps**:
  - Use `SELECT` to retrieve product details.
  - Apply the `WHERE` clause to filter products based on the chosen category (e.g., 'Electronics').

**MySQL Code**:
```sql
-- Task 1.2 - List Products in a Specific Category
SELECT ProductID, ProductName, Category, Price
FROM eCommerceOrders
WHERE Category = 'Electronics';
```

---

### **Task 1.3 - Retrieve Orders Between Two Dates**

**Retrieve orders placed between two specified dates to analyze purchasing trends within a set period.**  
This task is useful for time-bound analysis, such as seasonal trends or monthly performance evaluations.

**Instructions**:  
Identify orders placed within a defined date range to focus on a specific time frame.

- **Columns to Use**: `OrderID`, `OrderDate`, `CustomerID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `BETWEEN`, `ORDER BY`.
- **Steps**:
  - Use `SELECT` to fetch the necessary columns.
  - Apply `WHERE` with `BETWEEN` to filter orders by date range.
  - Order results by `OrderDate` in descending order to display recent orders first.

**MySQL Code**:
```sql
-- Task 1.3 - Retrieve Orders Between Two Dates
SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM eCommerceOrders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-01-31'  -- Replace with desired dates
ORDER BY OrderDate DESC;
```

---

### **Task 1.4 - Identify High-Value Orders**

**Identify all orders with a total amount above $1000 to focus on premium or high-value transactions.**  
This data is useful for financial analysis, targeting valuable customers, or understanding spending patterns.

**Instructions**:  
Filter for high-value orders to identify key transactions and significant revenue sources.

- **Columns to Use**: `OrderID`, `CustomerID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `ORDER BY`.
- **Steps**:
  - Use `SELECT` to fetch order details.
  - Filter by `TotalAmount` to retrieve orders with a value above $1000.
  - Order by `TotalAmount` in descending order to list the highest-value orders first.

**MySQL Code**:
```sql
-- Task 1.4 - Identify High-Value Orders
SELECT OrderID, CustomerID, TotalAmount
FROM eCommerceOrders
WHERE TotalAmount > 1000
ORDER BY TotalAmount DESC;
```

---

### **Task 1.5 - List Orders by Status**

**List orders filtered by specific statuses, such as 'Shipped' or 'Delivered', to understand order processing stages.**  
This task is useful for analyzing the fulfillment process and assessing workflow efficiency.

**Instructions**:  
Identify orders with particular statuses to track their progress in the fulfillment pipeline.

- **Columns to Use**: `OrderID`, `OrderStatus`, `CustomerID`.
- **Commands to Use**: `SELECT`, `WHERE`, `IN`, `ORDER BY`.
- **Steps**:
  - Use `SELECT` to retrieve order and status information.
  - Use `WHERE` with `IN` to filter orders by desired statuses.
  - Order by `OrderStatus` for grouping by status.

**MySQL Code**:
```sql
-- Task 1.5 - List Orders by Status
SELECT OrderID, OrderStatus, CustomerID
FROM eCommerceOrders
WHERE OrderStatus IN ('Shipped', 'Delivered')
ORDER BY OrderStatus;
```

---

### **Task 1.6 - Count Orders per Category**

**Count the number of orders in each product category to understand popularity across different product lines.**  
This data can aid in demand forecasting, category management, and resource allocation.

**Instructions**:  
Group and count orders by category to reveal trends in specific product types.

- **Columns to Use**: `Category`, `OrderID`.
- **Commands to Use**: `SELECT`, `COUNT`, `GROUP BY`, `ORDER BY`.
- **Steps**:
  - Use `COUNT` to calculate the number of orders for each category.
  - Group results by `Category`.
  - Order by count in descending order to see the most popular categories.

**MySQL Code**:
```sql
-- Task 1.6 - Count Orders per Category
SELECT Category, COUNT(OrderID) AS OrderCount
FROM eCommerceOrders
GROUP BY Category
ORDER BY OrderCount DESC;
```

---

### **Task 1.7 - Calculate Total Sales for Each Product**

**Calculate the total sales amount for each product to identify the best-selling items.**  
This task is useful for inventory decisions, sales analysis, and marketing efforts.

**Instructions**:  
Sum up total sales for each product to highlight high-demand items.

- **Columns to Use**: `ProductName`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `ORDER BY`.
- **Steps**:
  - Use `SUM` to calculate total sales for each product.
  - Group by `ProductName`.
  - Order by `TotalSales` in descending order to see the top products.

**MySQL Code**:
```sql
-- Task 1.7 - Calculate Total Sales for Each Product
SELECT ProductName, SUM(TotalAmount) AS TotalSales
FROM eCommerceOrders
GROUP BY ProductName
ORDER BY TotalSales DESC;
```

---

### **Task 1.8 - Retrieve Top 5 Most Frequent Customers**

**Identify the top 5 customers with the highest number of orders to recognize repeat buyers and potential loyalty program candidates.**  
Useful for customer segmentation and targeting loyal customers.

**Instructions**:  
Count orders for each customer to find the most frequent purchasers.

- **Columns to Use**: `CustomerID`, `CustomerName`, `OrderID`.
- **Commands to Use**: `SELECT`, `COUNT`, `GROUP BY`, `ORDER BY`, `LIMIT`.
- **Steps**:
  - Use `COUNT` with `GROUP BY` to count orders per customer.
  - Order by `OrderCount` and limit results to the top 5.

**MySQL Code**:
```sql
-- Task 1.8 - Retrieve Top 5 Most Frequent Customers
SELECT CustomerID, CustomerName, COUNT(OrderID) AS OrderCount
FROM eCommerceOrders
GROUP BY CustomerID, CustomerName
ORDER BY OrderCount DESC
LIMIT 5;
```

---

### **Task 1.9 - Calculate Average Order Value**

**Calculate the average value of all orders to understand typical spending behavior.**  
This information can guide pricing strategies and customer targeting.

**Instructions**:  
Calculate the average order value for insights into overall spending.

- **Columns to Use**: `TotalAmount`.
- **Commands to Use**: `SELECT`, `AVG`.
- **Steps**:
  - Use `AVG` to calculate the average order value across all orders.

**MySQL Code**:
```sql
-- Task 1.9 - Calculate Average Order Value
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM eCommerceOrders;
```

---

### **Task 1.10 - List Customers with High Average Order Value**

**Identify customers with an average order value above $1000 to focus on high-spending clientele.**  
This data is useful for targeting valuable customers for premium offers or loyalty programs.

**Instructions**:  
Calculate and filter customers with high average spending to identify premium segments.

- **Columns to Use**: `CustomerID`, `CustomerName`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `AVG`, `GROUP BY`, `HAVING`, `ORDER BY`.
- **Steps**:
  - Use `AVG` to calculate average order value per customer.
  - Use `GROUP BY` to group results by customer.
  - Apply `HAVING` to filter customers with an average order value above $1000.
  - Order by `AverageOrderValue` in descending order to list the highest-spending customers first.

**MySQL Code**:
```sql
-- Task 1.10 - List Customers with High Average Order Value
SELECT CustomerID, CustomerName, AVG(TotalAmount) AS AverageOrderValue
FROM eCommerceOrders
GROUP BY CustomerID, CustomerName
HAVING AverageOrderValue > 1000
ORDER BY AverageOrderValue DESC;
```

---

### **Task 1.11 - Retrieve Total Sales by Month**

**Calculate total sales for each month to analyze seasonal trends and monthly performance.**  
This information helps in identifying peak sales months and planning inventory accordingly.

**Instructions**:  
Aggregate total monthly sales to understand revenue distribution over time.

- **Columns to Use**: `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `MONTH`.
- **Steps**:
  - Use `SUM` to calculate total sales for each month.
  - Use `MONTH` function with `GROUP BY` to group data by month.
  - Order by month to display results chronologically.

**MySQL Code**:
```sql
-- Task 1.11 - Retrieve Total Sales by Month
SELECT MONTH(OrderDate) AS OrderMonth, SUM(TotalAmount) AS MonthlySales
FROM eCommerceOrders
GROUP BY OrderMonth
ORDER BY OrderMonth;
```

---

### **Task 1.12 - Find Top 3 Products by Total Sales**

**Identify the top 3 products with the highest total sales to prioritize inventory and marketing resources for best-sellers.**  
This helps in focusing efforts on the most popular products to maximize sales.

**Instructions**:  
Calculate total sales for each product and filter for the top 3 performers.

- **Columns to Use**: `ProductID`, `ProductName`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `ORDER BY`, `LIMIT`.
- **Steps**:
  - Use `SUM` to calculate total sales per product.
  - Use `GROUP BY` to aggregate results by product.
  - Order by `TotalSales` in descending order.
  - Limit the results to the top 3.

**MySQL Code**:
```sql
-- Task 1.12 - Find Top 3 Products by Total Sales
SELECT ProductID, ProductName, SUM(TotalAmount) AS TotalSales
FROM eCommerceOrders
GROUP BY ProductID, ProductName
ORDER BY TotalSales DESC
LIMIT 3;
```

---