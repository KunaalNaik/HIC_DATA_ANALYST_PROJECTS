### **Course Name**: **"SQL for Data Analysis: Beginner Level III - Expanding Insights with Advanced Basics"**

---

### **Course Summary**:

In this third installment of the beginner SQL series, learners will tackle more advanced beginner topics essential for real-world data analysis. Focusing on the remaining foundational concepts, such as advanced filtering, subqueries, data grouping with conditions, ranking functions, and set operations, this course provides a comprehensive beginner toolkit. By the end, participants will have a strong grasp of key SQL concepts, ready to transition to intermediate-level analysis.

---

### **Course Outline and Topics**

1. **Advanced Filtering Techniques (`BETWEEN`, `IN`, `LIKE`)**
   - **Objective**: Learn more advanced ways to filter data for complex queries.
   - **Example Task**: Find orders placed within a specific date range.

2. **Subqueries (Nested Queries)**
   - **Objective**: Use subqueries to perform calculations or data extraction within a main query.
   - **Example Task**: Retrieve customers who placed orders worth more than the average order amount.

3. **Aggregating Data with Conditional Filters (`HAVING`)**
   - **Objective**: Apply conditions to aggregated data for refined results.
   - **Example Task**: List product categories with an average price above a certain threshold.

4. **Window Functions (Ranking and Partitioning)**
   - **Objective**: Use ranking and partitioning functions to analyze data within specific groups.
   - **Example Task**: Rank products by popularity within each category.

5. **Set Operations (`INTERSECT`, `EXCEPT`)**
   - **Objective**: Compare and analyze data from multiple queries using set operations.
   - **Example Task**: Find products that are in stock but have never been ordered.

6. **Conditional Aggregations (CASE in Aggregates)**
   - **Objective**: Use `CASE` within aggregate functions to create conditional summaries.
   - **Example Task**: Count the number of high-value orders (over $500) per month.

7. **Pattern Matching with Wildcards (`LIKE` and Wildcards)**
   - **Objective**: Use pattern matching to search for data based on partial strings.
   - **Example Task**: Find all customers with email addresses from a specific domain (e.g., gmail.com).

8. **Complex Date Manipulations (DATEDIFF, DATEPART)**
   - **Objective**: Perform advanced date calculations for time-based analysis.
   - **Example Task**: Calculate the time difference between order date and shipping date.

9. **Grouping Sets and Rollups (Advanced Grouping)**
   - **Objective**: Group data at different levels for multi-dimensional analysis.
   - **Example Task**: Calculate total sales, grouped by category and then by product.

10. **Recursive Queries (WITH RECURSIVE)**  
    - **Objective**: Use recursive queries to analyze hierarchical or sequential data.
    - **Example Task**: Retrieve all subcategories of a given category in a hierarchical category table.

---

### **Detailed Plan with Example Tasks**

Below are 15 tasks using the latest format, covering these new topics in a structured, easy-to-follow manner.

---

### **Task 1.1.1: Find Orders within a Specific Date Range**

**Description**: Using `BETWEEN` helps specify date or numeric ranges in SQL. This task finds orders within a defined date range.

**Project Task**:
- Retrieve orders placed within a specified date range.
- Useful for time-based analysis, like finding quarterly or monthly orders.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderDate`, `CustomerID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `BETWEEN`.
- **Steps**:
  - Use `SELECT` to retrieve relevant columns.
  - Apply `WHERE` with `BETWEEN` to filter `OrderDate` within a date range (e.g., last quarter).

**SQL Code**:
```sql
%%sql
-- Task 1.1.1 - Find Orders within a Specific Date Range
SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM eCommerceOrders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY OrderDate ASC
```

---

### **Task 1.1.2: Retrieve Orders with Specific Statuses**

**Description**: Using `IN` allows filtering by multiple values. This task retrieves orders with specific statuses for monitoring.

**Project Task**:
- Find orders with statuses "Shipped", "Delivered", or "Canceled".
- Useful for grouping multiple statuses in one query.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderStatus`, `CustomerID`.
- **Commands to Use**: `SELECT`, `WHERE`, `IN`.
- **Steps**:
  - Use `SELECT` to retrieve `OrderID`, `OrderStatus`, and `CustomerID`.
  - Apply `WHERE` with `IN` to filter by multiple `OrderStatus` values.

**SQL Code**:
```sql
%%sql
-- Task 1.1.2 - Retrieve Orders with Specific Statuses
SELECT OrderID, OrderStatus, CustomerID
FROM eCommerceOrders
WHERE OrderStatus IN ('Shipped', 'Delivered', 'Canceled')
ORDER BY OrderStatus
```

---

### **Task 1.2.1: Find Customers with Above-Average Order Amounts Using Subquery**

**Description**: Subqueries allow calculations within the main query. This task finds customers whose order total exceeds the average.

**Project Task**:
- Retrieve customers who placed orders with a total amount above the average.
- Helps identify high-spending customers for targeted campaigns.

**Instructions**:
- **Columns to Use**: `CustomerID`, `CustomerName`, `OrderID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `Subquery`.
- **Steps**:
  - Use a subquery to calculate the average `TotalAmount`.
  - Filter main query to show only orders with `TotalAmount` above the average.

**SQL Code**:
```sql
%%sql
-- Task 1.2.1 - Find Customers with Above-Average Order Amounts
SELECT CustomerID, CustomerName, OrderID, TotalAmount
FROM eCommerceOrders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM eCommerceOrders)
ORDER BY TotalAmount DESC
```

---

### **Task 1.2.2: List Categories with Average Price Above Threshold**

**Description**: `HAVING` allows filtering after grouping. This task lists categories with an average price above $100.

**Project Task**:
- Retrieve categories with an average product price above $100.
- Useful for identifying premium product categories.

**Instructions**:
- **Columns to Use**: `Category`, `Price`.
- **Commands to Use**: `SELECT`, `AVG`, `GROUP BY`, `HAVING`.
- **Steps**:
  - Use `SELECT` with `AVG` to calculate the average price per category.
  - Apply `HAVING` to filter categories with an average above $100.

**SQL Code**:
```sql
%%sql
-- Task 1.2.2 - List Categories with Average Price Above Threshold
SELECT Category, AVG(Price) AS "Average Price"
FROM eCommerceOrders
GROUP BY Category
HAVING AVG(Price) > 100
ORDER BY "Average Price" DESC
```

---

### **Task 1.3.1: Rank Products by Popularity within Category**

**Description**: Ranking functions allow ordering within groups. This task ranks products by quantity within each category.

**Project Task**:
- Rank products by quantity ordered within each category.
- Helps identify top-selling products in each category.

**Instructions**:
- **Columns to Use**: `Category`, `ProductID`, `ProductName`, `Quantity`.
- **Commands to Use**: `SELECT`, `RANK`, `PARTITION BY`.
- **Steps**:
  - Use `RANK()` to rank products within each `Category` by `Quantity`.
  - Use `PARTITION BY` to create groups by `Category`.

**SQL Code**:
```sql
%%sql
-- Task 1.3.1 - Rank Products by Popularity within Category
SELECT Category, ProductID, ProductName, Quantity,
       RANK() OVER (PARTITION BY Category ORDER BY Quantity DESC) AS "Popularity Rank"
FROM eCommerceOrders
ORDER BY Category, "Popularity Rank"
```

---

### **Task 2.1.1: Find Products In-Stock but Never Ordered**

**Description**: Set operations like `EXCEPT` allow comparison of result sets. This task finds products in stock but not ordered.

**Project Task**:
- Retrieve products available in stock but with no orders.
- Useful for inventory checks and understanding product demand.

**Instructions**:
- **Columns to Use**: `ProductID`.
- **Commands to Use**: `SELECT`, `EXCEPT`.
- **Steps**:
  - Use two queries: one to list products in stock and another to list ordered products.
  - Use `EXCEPT` to find products in stock but not ordered.

**SQL Code**:
```sql
%%sql
-- Task 2.1.1 - Find Products In-Stock but Never Ordered
SELECT ProductID FROM ProductDetails
EXCEPT
SELECT DISTINCT ProductID FROM eCommerceOrders
```

---

### **Task 2.1.2: Count High-Value Orders Using Conditional Aggregation**

**Description**: `CASE` in aggregates enables conditional counting. This task counts high-value orders per month.

**Project Task**:
- Count the number of high-value orders (over $500) for each month.
- Helps analyze

 demand for premium orders over time.

**Instructions**:
- **Columns to Use**: `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `COUNT`, `CASE`, `GROUP BY`.
- **Steps**:
  - Use `CASE` inside `COUNT` to count only orders with `TotalAmount > 500`.
  - Group results by month (use `strftime` or equivalent to extract month from `OrderDate`).

**SQL Code**:
```sql
%%sql
-- Task 2.1.2 - Count High-Value Orders Using Conditional Aggregation
SELECT strftime('%Y-%m', OrderDate) AS "Order Month",
       COUNT(CASE WHEN TotalAmount > 500 THEN 1 END) AS "High Value Orders"
FROM eCommerceOrders
GROUP BY "Order Month"
ORDER BY "Order Month"
```

---

### **Task 2.2.1: Find Customers with Specific Email Domain**

**Description**: Pattern matching finds data with specific text patterns. This task finds customers with email addresses from a certain domain.

**Project Task**:
- Retrieve all customers with email addresses ending in "@gmail.com".
- Useful for targeted marketing and segmenting customers by domain.

**Instructions**:
- **Columns to Use**: `CustomerID`, `Email`.
- **Commands to Use**: `SELECT`, `LIKE`.
- **Steps**:
  - Use `SELECT` to retrieve relevant customer details.
  - Apply `LIKE` with `%` to filter email addresses ending with "@gmail.com".

**SQL Code**:
```sql
%%sql
-- Task 2.2.1 - Find Customers with Specific Email Domain
SELECT CustomerID, Email
FROM CustomerDetails
WHERE Email LIKE '%@gmail.com'
ORDER BY CustomerID
```

---

### **Task 2.3.1: Calculate Days Between Order and Shipping Date**

**Description**: Date calculations help in time-based analysis. This task calculates the time difference between `OrderDate` and `ShippingDate`.

**Project Task**:
- Calculate the days between order and shipping date to measure processing time.
- Useful for optimizing delivery times and improving customer satisfaction.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderDate`, `ShippingDate`.
- **Commands to Use**: `SELECT`, `DATEDIFF`.
- **Steps**:
  - Use `DATEDIFF` (or equivalent) to calculate the difference between `OrderDate` and `ShippingDate`.
  - Display results as "Processing Days".

**SQL Code**:
```sql
%%sql
-- Task 2.3.1 - Calculate Days Between Order and Shipping Date
SELECT OrderID, OrderDate, ShippingDate,
       julianday(ShippingDate) - julianday(OrderDate) AS "Processing Days"
FROM eCommerceOrders
WHERE ShippingDate IS NOT NULL
ORDER BY OrderDate
```

---

### **Task 3.1.1: Calculate Sales Totals Using Rollups**

**Description**: Rollups allow hierarchical grouping. This task calculates total sales, grouped by category and product.

**Project Task**:
- Calculate sales totals by category and product for a multi-level summary.
- Useful for analyzing both overall and detailed sales performance.

**Instructions**:
- **Columns to Use**: `Category`, `ProductID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `GROUP BY`, `ROLLUP`.
- **Steps**:
  - Use `GROUP BY` with `ROLLUP` to aggregate sales by `Category` and `ProductID`.
  - Include total sales at each level of grouping.

**SQL Code**:
```sql
%%sql
-- Task 3.1.1 - Calculate Sales Totals Using Rollups
SELECT Category, ProductID, SUM(TotalAmount) AS "Total Sales"
FROM eCommerceOrders
GROUP BY ROLLUP(Category, ProductID)
ORDER BY Category, ProductID
```

---