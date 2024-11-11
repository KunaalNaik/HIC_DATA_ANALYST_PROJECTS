### **Course Name**: **"SQL for Data Analysis: Intermediate Level II - Advanced Data Analysis and Manipulation Techniques"**

---

### **Course Summary**:

This course builds upon the concepts introduced in Intermediate Level I, focusing on advanced data manipulation, analysis, and reporting techniques. Learners will dive deeper into SQL by working with complex subqueries, advanced window functions, pivoting data, building complex reports, and working with JSON and XML data types. By the end of this course, participants will be equipped to handle complex queries for analytical tasks, automate reporting, and manage hierarchical and semi-structured data.

---

### **Course Outline and Topics**

1. **Complex Subqueries and Correlated Subqueries**  
   - **Objective**: Learn to use subqueries that depend on data from the main query.
   - **Example Task**: Find customers who have placed orders with the highest quantity within their category.

2. **Advanced Window Functions (ROW_NUMBER, NTILE)**  
   - **Objective**: Use advanced window functions to partition and rank data in different ways.
   - **Example Task**: Rank orders by `TotalAmount` within each customer.

3. **Pivoting Data with Conditional Aggregations**  
   - **Objective**: Learn to pivot data by transforming rows into columns using `CASE` and aggregates.
   - **Example Task**: Show total sales for each product category as columns in a single row.

4. **Recursive Common Table Expressions (CTEs)**  
   - **Objective**: Use recursive CTEs to explore hierarchical or recursive relationships in data.
   - **Example Task**: Generate a hierarchy of product categories and subcategories.

5. **Using JSON Functions to Extract Data from JSON Columns**  
   - **Objective**: Extract and analyze data stored in JSON format.
   - **Example Task**: Extract specific details from a JSON column in the customer table.

6. **Data Validation and Integrity Checks**  
   - **Objective**: Use SQL to validate data integrity and identify inconsistencies.
   - **Example Task**: Find orders with quantities or total amounts that don’t match expected values.

7. **Advanced String Manipulations (Regular Expressions)**  
   - **Objective**: Use regex functions to search for complex patterns within strings.
   - **Example Task**: Find all email addresses that don’t match a specific format (e.g., missing "@" or ".com").

8. **Nested Transactions and Error Handling**  
   - **Objective**: Understand nested transactions and handle errors for data integrity.
   - **Example Task**: Implement nested transactions to update order and inventory data, with rollback on error.

9. **Advanced Reporting with Temporary Tables and Views**  
   - **Objective**: Use temporary tables and views to build complex multi-step reports.
   - **Example Task**: Create a report summarizing monthly revenue by product category with year-over-year comparisons.

10. **Working with XML Data and XPath Functions**  
    - **Objective**: Extract and query data stored in XML format.
    - **Example Task**: Retrieve specific data fields from XML stored within a table column.

---

### **Detailed Plan with Example Tasks**

Below is a list of 15 tasks that align with the topics above. Each task is designed to deepen SQL skills through intermediate-to-advanced challenges related to real-world eCommerce analytics.

---

### **Course Tasks**

---

### **Task 1.1.1: Find Customers with Highest Quantity Orders within Category Using Correlated Subqueries**

**Description**: Correlated subqueries allow comparisons within the same data context. This task identifies customers with the highest quantity orders within their category.

**Project Task**:
- Retrieve customers who have placed the highest quantity orders in each product category.
- Useful for identifying high-demand customers per category.

**Instructions**:
- **Columns to Use**: `CustomerID`, `ProductID`, `Category`, `Quantity`.
- **Commands to Use**: `SELECT`, `WHERE`, `Subquery`.
- **Steps**:
  - Use a correlated subquery to find the maximum `Quantity` for each `Category`.
  - Filter the main query to show only orders that match this maximum `Quantity`.

**SQL Code**:
```sql
%%sql
-- Task 1.1.1 - Find Customers with Highest Quantity Orders within Category
SELECT CustomerID, ProductID, Category, Quantity
FROM eCommerceOrders e
WHERE Quantity = (
    SELECT MAX(Quantity)
    FROM eCommerceOrders
    WHERE Category = e.Category
)
ORDER BY Category, Quantity DESC
```

---

### **Task 1.2.1: Rank Orders by TotalAmount for Each Customer Using ROW_NUMBER**

**Description**: Ranking functions like `ROW_NUMBER` allow ordered ranking within groups. This task ranks orders by `TotalAmount` within each customer.

**Project Task**:
- Rank orders by `TotalAmount` for each customer to identify high-value transactions.
- Helps analyze customer spending patterns.

**Instructions**:
- **Columns to Use**: `CustomerID`, `OrderID`, `TotalAmount`.
- **Commands to Use**: `ROW_NUMBER`, `OVER`, `PARTITION BY`.
- **Steps**:
  - Use `ROW_NUMBER()` with `PARTITION BY` to rank orders within each customer.
  - Order by `TotalAmount` in descending order.

**SQL Code**:
```sql
%%sql
-- Task 1.2.1 - Rank Orders by TotalAmount for Each Customer
SELECT CustomerID, OrderID, TotalAmount,
       ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY TotalAmount DESC) AS "Order Rank"
FROM eCommerceOrders
ORDER BY CustomerID, "Order Rank"
```

---

### **Task 1.3.1: Pivot Total Sales by Category Using Conditional Aggregation**

**Description**: Pivoting data by category helps organize aggregated data as columns. This task pivots total sales by category.

**Project Task**:
- Display total sales for each category as columns in a single row.
- Useful for generating summary tables in reports.

**Instructions**:
- **Columns to Use**: `Category`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `CASE`.
- **Steps**:
  - Use `SUM` with `CASE` to calculate total sales per category.
  - Pivot data by placing each category in a separate `CASE` statement.

**SQL Code**:
```sql
%%sql
-- Task 1.3.1 - Pivot Total Sales by Category
SELECT 
    SUM(CASE WHEN Category = 'Electronics' THEN TotalAmount ELSE 0 END) AS "Electronics Sales",
    SUM(CASE WHEN Category = 'Clothing' THEN TotalAmount ELSE 0 END) AS "Clothing Sales",
    SUM(CASE WHEN Category = 'Home Appliances' THEN TotalAmount ELSE 0 END) AS "Home Appliances Sales"
FROM eCommerceOrders
```

---

### **Task 1.4.1: Generate Category Hierarchy Using Recursive CTE**

**Description**: Recursive CTEs are used to analyze hierarchical data structures. This task creates a hierarchy of product categories.

**Project Task**:
- Generate a hierarchy of categories and subcategories.
- Useful for understanding product relationships and category structure.

**Instructions**:
- **Columns to Use**: `CategoryID`, `ParentCategoryID`, `CategoryName`.
- **Commands to Use**: `WITH RECURSIVE`.
- **Steps**:
  - Define a recursive CTE to query the hierarchy from parent to child categories.
  - Use `UNION ALL` to recursively connect subcategories.

**SQL Code**:
```sql
%%sql
-- Task 1.4.1 - Generate Category Hierarchy Using Recursive CTE
WITH RECURSIVE CategoryHierarchy AS (
    SELECT CategoryID, ParentCategoryID, CategoryName, 1 AS Level
    FROM Categories
    WHERE ParentCategoryID IS NULL
    UNION ALL
    SELECT c.CategoryID, c.ParentCategoryID, c.CategoryName, ch.Level + 1
    FROM Categories c
    JOIN CategoryHierarchy ch ON c.ParentCategoryID = ch.CategoryID
)
SELECT * FROM CategoryHierarchy
ORDER BY Level, CategoryID
```

---

### **Task 1.5.1: Extract JSON Data for Customer Preferences**

**Description**: JSON functions allow extraction of specific values from JSON fields. This task extracts preferences from JSON data.

**Project Task**:
- Extract specific details (e.g., preferred category) from JSON data in a customer preferences column.
- Useful for targeted marketing analysis.

**Instructions**:
- **Columns to Use**: `CustomerID`, `Preferences`.
- **Commands to Use**: JSON functions (`JSON_EXTRACT`, `JSON_VALUE`).
- **Steps**:
  - Use JSON functions to extract specific details from the `Preferences` JSON column.

**SQL Code**:
```sql
%%sql
-- Task 1.5.1 - Extract JSON Data for Customer Preferences
SELECT CustomerID, JSON_EXTRACT(Preferences, '$.preferredCategory') AS "Preferred Category"
FROM CustomerDetails
WHERE JSON_EXTRACT(Preferences, '$.preferredCategory') IS NOT NULL
```

---

### **Task 1.6.1: Identify Orders with Data Inconsistencies**

**Description**: Data validation checks help maintain data integrity. This task identifies orders with unexpected values.

**Project Task**:
- Identify orders where `Quantity * Price` doesn’t match `TotalAmount`.
- Useful for spotting data entry errors or inconsistencies.

**Instructions**:
- **Columns to Use**: `OrderID`, `Quantity`, `Price`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`.
- **Steps**:
  - Use `WHERE` to filter records where `Quantity * Price` does not equal `TotalAmount`.

**SQL Code**

:
```sql
%%sql
-- Task 1.6.1 - Identify Orders with Data Inconsistencies
SELECT OrderID, Quantity, Price, TotalAmount
FROM eCommerceOrders
WHERE Quantity * Price <> TotalAmount
```

---

### **Task 2.1.1: Validate Email Format Using Regular Expressions**

**Description**: Regular expressions enable complex pattern matching. This task identifies incorrectly formatted emails.

**Project Task**:
- Find email addresses that do not follow the standard email format (e.g., missing "@" or ".com").
- Useful for maintaining data quality in contact information.

**Instructions**:
- **Columns to Use**: `CustomerID`, `Email`.
- **Commands to Use**: `REGEXP`.
- **Steps**:
  - Use `REGEXP` to search for emails that do not match the expected format.

**SQL Code**:
```sql
%%sql
-- Task 2.1.1 - Validate Email Format Using Regular Expressions
SELECT CustomerID, Email
FROM CustomerDetails
WHERE Email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
```

---

### **Task 2.2.1: Implement Nested Transactions for Order and Inventory Updates**

**Description**: Nested transactions ensure data consistency. This task updates order and inventory data with error handling.

**Project Task**:
- Update inventory and order data within a transaction, with rollback on error.
- Useful for maintaining consistency in multi-step processes.

**Instructions**:
- **Columns to Use**: `OrderID`, `ProductID`, `Quantity`.
- **Commands to Use**: `BEGIN`, `COMMIT`, `ROLLBACK`.
- **Steps**:
  - Start a transaction to update both order and inventory data.
  - Rollback the transaction if an error occurs.

**SQL Code**:
```sql
%%sql
-- Task 2.2.1 - Implement Nested Transactions for Order and Inventory Updates
BEGIN;
UPDATE Inventory
SET StockQuantity = StockQuantity - e.Quantity
FROM eCommerceOrders e
WHERE Inventory.ProductID = e.ProductID AND e.OrderID = 'ORD123456';
IF @@ERROR != 0 ROLLBACK;
UPDATE Orders
SET Status = 'Completed'
WHERE OrderID = 'ORD123456';
IF @@ERROR != 0 ROLLBACK;
COMMIT;
```

---

### **Task 2.3.1: Create Monthly Revenue Report with Temporary View**

**Description**: Temporary views simplify report generation. This task creates a view to analyze monthly revenue.

**Project Task**:
- Summarize monthly revenue for each product category with a temporary view.
- Useful for building multi-step reports for trend analysis.

**Instructions**:
- **Columns to Use**: `OrderDate`, `Category`, `TotalAmount`.
- **Commands to Use**: `CREATE VIEW`, `GROUP BY`.
- **Steps**:
  - Create a temporary view with monthly revenue data.
  - Use the view for further analysis or reporting.

**SQL Code**:
```sql
%%sql
-- Task 2.3.1 - Create Monthly Revenue Report with Temporary View
CREATE VIEW MonthlyRevenue AS
SELECT strftime('%Y-%m', OrderDate) AS "Month", Category, SUM(TotalAmount) AS "Revenue"
FROM eCommerceOrders
GROUP BY "Month", Category;
```

---

### **Task 2.4.1: Extract XML Data Using XPath Functions**

**Description**: XPath functions allow querying XML data. This task extracts fields from XML data.

**Project Task**:
- Retrieve customer contact preferences stored in XML.
- Useful for analyzing semi-structured data in XML format.

**Instructions**:
- **Columns to Use**: `CustomerID`, `PreferencesXML`.
- **Commands to Use**: XML functions (`EXTRACTVALUE`, `XPATH`).
- **Steps**:
  - Use XPath functions to extract data from the XML field `PreferencesXML`.

**SQL Code**:
```sql
%%sql
-- Task 2.4.1 - Extract XML Data Using XPath Functions
SELECT CustomerID, EXTRACTVALUE(PreferencesXML, '/preferences/contactMethod') AS "Contact Method"
FROM CustomerDetails
WHERE PreferencesXML IS NOT NULL
```

---