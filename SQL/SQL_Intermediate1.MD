### **Course Name**: **"SQL for Data Analysis: Intermediate Level I - Advanced Techniques in eCommerce Analytics"**

---

### **Course Summary**:

This intermediate course builds on the foundational skills from Beginner Level I, introducing more complex SQL concepts and techniques. It focuses on enhancing analytical capabilities with advanced filtering, multi-level aggregations, complex joins, nested subqueries, and data manipulation. Each topic is explored through practical, real-world tasks, making learners proficient in handling large datasets, extracting insights, and crafting detailed reports.

---

### **Course Outline and Topics**

1. **Advanced Filtering with Complex Conditions**  
   - **Objective**: Use multiple conditions with `AND`, `OR`, and `NOT` to filter data based on complex criteria.
   - **Example Task**: Retrieve all orders from specific high-value customers who have purchased within the last three months.

2. **Multi-Level Aggregation and Grouping**  
   - **Objective**: Perform multi-level grouping and aggregations to analyze data across multiple dimensions.
   - **Example Task**: Calculate total revenue by category and by month for trend analysis.

3. **Advanced Joins (Self Joins, Outer Joins, Cross Joins)**  
   - **Objective**: Use advanced joins to relate data within the same table or combine data across multiple tables, even when data might not directly match.
   - **Example Task**: Identify customers who placed an order without providing a complete shipping address.

4. **Nested Subqueries with Aggregations**  
   - **Objective**: Use subqueries within the `WHERE` clause or `SELECT` clause to perform advanced calculations.
   - **Example Task**: Find products whose total sales are above the average for their category.

5. **Window Functions for Rolling and Cumulative Totals**  
   - **Objective**: Use window functions to calculate rolling totals and cumulative sums across ordered data.
   - **Example Task**: Calculate a running total of sales for each product within a specific period.

6. **Data Transformation with Case Statements and Conditional Aggregations**  
   - **Objective**: Use `CASE` and conditional aggregations for advanced transformations.
   - **Example Task**: Categorize customers based on their total spending and count the number in each spending tier.

7. **Advanced Pattern Matching (LIKE with Multiple Patterns)**  
   - **Objective**: Perform advanced pattern matching with complex `LIKE` patterns to search for specific strings or formats.
   - **Example Task**: Find customers whose emails are from specific domains (e.g., gmail, yahoo) and who registered within a certain period.

8. **Recursive Queries for Hierarchical Data**  
   - **Objective**: Use recursive CTEs to analyze hierarchical data structures.
   - **Example Task**: Analyze subcategories and their parent categories in a hierarchical product category table.

9. **Combining Set Operations with Complex Filters (`INTERSECT`, `EXCEPT` with `WHERE`)**  
   - **Objective**: Use `INTERSECT` and `EXCEPT` with filters to extract refined comparisons.
   - **Example Task**: Find customers who have placed orders but have not made purchases in the last six months.

10. **Temporary Tables and Views for Simplified Analysis**  
    - **Objective**: Create and use temporary tables and views to simplify complex queries.
    - **Example Task**: Create a view showing high-value orders, and use it for detailed analysis.

---

### **Detailed Plan with Example Tasks**

Each topic will include a practical task, designed to reinforce intermediate SQL skills with real-world applications in eCommerce. Below is a list of 15 tasks with structured details.

---

### **Course Tasks**

---

### **Task 1.1.1: Retrieve High-Value Orders by Specific Customers in Last Three Months**

**Description**: Use advanced filtering with multiple conditions to retrieve targeted data. This task finds recent high-value orders from selected customers.

**Project Task**:
- Retrieve orders placed by high-value customers (`TotalAmount` > $500) in the last three months.
- Helps focus on recent transactions from premium customers.

**Instructions**:
- **Columns to Use**: `CustomerID`, `OrderID`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `AND`, `OR`.
- **Steps**:
  - Use `SELECT` to choose columns relevant to customer orders.
  - Apply multiple conditions using `AND` and `OR` to filter by `TotalAmount`, specific `CustomerID`, and `OrderDate` range.

**SQL Code**:
```sql
%%sql
-- Task 1.1.1 - Retrieve High-Value Orders by Specific Customers in Last Three Months
SELECT CustomerID, OrderID, OrderDate, TotalAmount
FROM eCommerceOrders
WHERE TotalAmount > 500
  AND OrderDate >= DATE('now', '-3 months')
  AND CustomerID IN ('CUST0001', 'CUST0023', 'CUST0045')  -- Replace with specific customer IDs
ORDER BY OrderDate DESC
```

---

### **Task 1.2.1: Calculate Monthly Revenue by Category**

**Description**: Multi-level grouping provides insights across different dimensions. This task calculates revenue by category and month.

**Project Task**:
- Aggregate total revenue by category and month to analyze seasonal trends across categories.
- Useful for financial planning and inventory management.

**Instructions**:
- **Columns to Use**: `Category`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `strftime`.
- **Steps**:
  - Use `SUM` to calculate total sales by category and month.
  - Group by `Category` and formatted month from `OrderDate`.

**SQL Code**:
```sql
%%sql
-- Task 1.2.1 - Calculate Monthly Revenue by Category
SELECT Category, strftime('%Y-%m', OrderDate) AS "Month", 
       SUM(TotalAmount) AS "Monthly Revenue"
FROM eCommerceOrders
GROUP BY Category, "Month"
ORDER BY Category, "Month"
```

---

### **Task 1.3.1: Identify Incomplete Orders with Advanced Joins**

**Description**: Advanced joins, such as outer joins, help find unmatched or incomplete data. This task identifies orders without a complete shipping address.

**Project Task**:
- Find all orders where `ShippingAddress` is missing using a `LEFT JOIN`.
- Useful for identifying incomplete records and improving data quality.

**Instructions**:
- **Columns to Use**: `OrderID`, `CustomerID`, `ShippingAddress`.
- **Commands to Use**: `SELECT`, `LEFT JOIN`, `WHERE`.
- **Steps**:
  - Use `LEFT JOIN` to combine `eCommerceOrders` with a hypothetical `CustomerAddresses` table.
  - Filter for records with `NULL` in the `ShippingAddress`.

**SQL Code**:
```sql
%%sql
-- Task 1.3.1 - Identify Incomplete Orders with Advanced Joins
SELECT e.OrderID, e.CustomerID, a.ShippingAddress
FROM eCommerceOrders e
LEFT JOIN CustomerAddresses a ON e.CustomerID = a.CustomerID
WHERE a.ShippingAddress IS NULL
ORDER BY e.OrderID
```

---

### **Task 1.4.1: Find Products with Above-Average Sales in Category Using Subquery**

**Description**: Using subqueries within filters allows for advanced calculations. This task finds products with above-average sales in their category.

**Project Task**:
- Retrieve products with total sales above the category average.
- Helps identify top-performing products within each category.

**Instructions**:
- **Columns to Use**: `ProductID`, `Category`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `Subquery`.
- **Steps**:
  - Use a subquery to calculate average sales for each category.
  - Filter the main query to show only products with total sales above their category average.

**SQL Code**:
```sql
%%sql
-- Task 1.4.1 - Find Products with Above-Average Sales in Category
SELECT ProductID, Category, SUM(TotalAmount) AS "Total Sales"
FROM eCommerceOrders
GROUP BY ProductID, Category
HAVING "Total Sales" > (
    SELECT AVG(SUM(TotalAmount))
    FROM eCommerceOrders
    WHERE Category = eCommerceOrders.Category
    GROUP BY Category
)
ORDER BY "Total Sales" DESC
```

---

### **Task 1.5.1: Calculate Running Total of Sales by Product**

**Description**: Window functions allow for calculations across ordered rows. This task calculates a cumulative total of sales per product.

**Project Task**:
- Calculate a running total of sales for each product.
- Useful for tracking cumulative performance over time.

**Instructions**:
- **Columns to Use**: `ProductID`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SUM`, `OVER`, `PARTITION BY`, `ORDER BY`.
- **Steps**:
  - Use `SUM` with `OVER` to calculate a running total.
  - Partition by `ProductID` and order by `OrderDate`.

**SQL Code**:
```sql
%%sql
-- Task 1.5.1 - Calculate Running Total of Sales by Product
SELECT ProductID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS "Running Total"
FROM eCommerceOrders
ORDER BY ProductID, OrderDate
```

---

### **Task 1.6.1: Classify Customers by Spending Tiers**

**Description**: Conditional aggregation allows grouping by custom categories. This task classifies customers based on total spending.

**Project Task

**:
- Group customers into "Low", "Medium", and "High" spending tiers based on total spending.
- Helps in customer segmentation and targeted marketing.

**Instructions**:
- **Columns to Use**: `CustomerID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `CASE`, `GROUP BY`.
- **Steps**:
  - Use `SUM` to calculate total spending per customer.
  - Use `CASE` to classify spending into three tiers.

**SQL Code**:
```sql
%%sql
-- Task 1.6.1 - Classify Customers by Spending Tiers
SELECT CustomerID,
       SUM(TotalAmount) AS "Total Spending",
       CASE
           WHEN SUM(TotalAmount) < 500 THEN 'Low'
           WHEN SUM(TotalAmount) BETWEEN 500 AND 2000 THEN 'Medium'
           ELSE 'High'
       END AS "Spending Tier"
FROM eCommerceOrders
GROUP BY CustomerID
ORDER BY "Total Spending" DESC
```

---

### **Task 2.1.1: Advanced Pattern Matching for Customer Segmentation**

**Description**: Complex `LIKE` patterns can search for specific data formats. This task finds customers with specific email domains.

**Project Task**:
- Find all customers with email domains that are either "gmail.com" or "yahoo.com".
- Helps segment customers by email domain for targeted communication.

**Instructions**:
- **Columns to Use**: `CustomerID`, `Email`.
- **Commands to Use**: `SELECT`, `LIKE`, `OR`.
- **Steps**:
  - Use `LIKE` with `%` to filter by email domains.
  - Use `OR` to include both domains in the filter.

**SQL Code**:
```sql
%%sql
-- Task 2.1.1 - Advanced Pattern Matching for Customer Segmentation
SELECT CustomerID, Email
FROM CustomerDetails
WHERE Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com'
ORDER BY CustomerID
```

---

### **Task 2.2.1: Find Customers with No Orders in Last Six Months**

**Description**: Set operations with conditions refine comparisons across multiple datasets. This task identifies inactive customers.

**Project Task**:
- Retrieve customers who have not placed any orders in the last six months.
- Useful for re-engagement campaigns targeting inactive customers.

**Instructions**:
- **Columns to Use**: `CustomerID`, `OrderDate`.
- **Commands to Use**: `EXCEPT`, `WHERE`, `DATE`.
- **Steps**:
  - Use `EXCEPT` to find customers with orders outside the last six months.
  - Apply `WHERE` and date conditions to filter recent orders.

**SQL Code**:
```sql
%%sql
-- Task 2.2.1 - Find Customers with No Orders in Last Six Months
SELECT CustomerID FROM CustomerDetails
EXCEPT
SELECT DISTINCT CustomerID
FROM eCommerceOrders
WHERE OrderDate >= DATE('now', '-6 months')
ORDER BY CustomerID
```

---

### **Task 2.3.1: Create Temporary View for High-Value Orders**

**Description**: Temporary views simplify complex queries for repeated use. This task creates a view for high-value orders.

**Project Task**:
- Create a view to simplify analysis of high-value orders.
- Useful for tracking significant transactions and related analytics.

**Instructions**:
- **Columns to Use**: `OrderID`, `CustomerID`, `TotalAmount`.
- **Commands to Use**: `CREATE VIEW`, `SELECT`.
- **Steps**:
  - Use `CREATE VIEW` to define a view with orders where `TotalAmount > 500`.
  - Use the view for further analysis.

**SQL Code**:
```sql
%%sql
-- Task 2.3.1 - Create Temporary View for High-Value Orders
CREATE VIEW HighValueOrders AS
SELECT OrderID, CustomerID, TotalAmount
FROM eCommerceOrders
WHERE TotalAmount > 500
```

---