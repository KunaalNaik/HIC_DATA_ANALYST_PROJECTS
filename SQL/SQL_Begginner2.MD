### **Course Name**: **"SQL for Data Analysis: Beginner Level II - Practical SQL for Real-World eCommerce Analytics"**

---

### **Course Summary**:

Building on the foundational skills from the first course, this course takes SQL learners a step further into data analysis with practical tools and techniques. Focusing on the eCommerce dataset, learners will tackle new tasks like handling NULL values, using aliases, joining tables, and creating conditional calculations. By the end, participants will be well-equipped with skills for data cleaning, multi-table analysis, and custom reporting, essential for real-world data analysis tasks.

---

### **Course Outline and Tasks**

Below is a list of 15 tasks using the numbering format for grouping, with each task presented in the latest format. Each task covers beginner-level concepts that are commonly used in SQL data analysis.

---

### **Task 1.1.1: Create Order Report with Aliases**

**Description**: Using aliases makes query results more readable by renaming columns and tables. This task helps create a report with clearer, custom column names.

**Project Task**:
- Generate a report of customer orders with renamed columns for better readability.
- Simplify column names to enhance clarity for end-users reviewing the report.

**Instructions**:
- **Columns to Use**: `CustomerID`, `CustomerName`, `OrderID`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `AS`.
- **Steps**:
  - Use `AS` to assign aliases to column names, such as renaming `CustomerID` to "ID" and `CustomerName` to "Customer Name".
  - Use `SELECT` to retrieve these columns with the new names.

**SQL Code**:
```sql
%%sql
-- Task 1.1.1 - Create Order Report with Aliases
SELECT CustomerID AS ID, CustomerName AS "Customer Name", OrderID AS "Order Number", 
       OrderDate AS "Order Date", TotalAmount AS "Total Price"
FROM eCommerceOrders
ORDER BY OrderDate ASC
```

---

### **Task 1.1.2: Calculate Discounted Total for Orders**

**Description**: Calculations in SQL allow us to derive new values directly in queries. In this task, we calculate a discounted total to understand the impact of promotions.

**Project Task**:
- Calculate and display the total amount for each order after applying a 10% discount.
- This can help evaluate how promotions impact revenue.

**Instructions**:
- **Columns to Use**: `OrderID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `AS`.
- **Steps**:
  - Use `SELECT` to retrieve `OrderID` and calculate `TotalAmount * 0.9` as the discounted total.
  - Assign an alias "Discounted Price" to the calculated column.

**SQL Code**:
```sql
%%sql
-- Task 1.1.2 - Calculate Discounted Total for Orders
SELECT OrderID, TotalAmount, 
       TotalAmount * 0.9 AS "Discounted Price"
FROM eCommerceOrders
ORDER BY TotalAmount DESC
```

---

### **Task 1.2.1: Identify Orders with Missing Shipping Addresses**

**Description**: Identifying NULL values is essential for data cleaning and accuracy. This task focuses on finding orders without complete shipping details.

**Project Task**:
- Retrieve a list of orders that are missing shipping addresses.
- Replace NULL addresses with "Pending" for better readability.

**Instructions**:
- **Columns to Use**: `OrderID`, `ShippingAddress`.
- **Commands to Use**: `SELECT`, `WHERE`, `COALESCE`.
- **Steps**:
  - Use `SELECT` to retrieve `OrderID` and `ShippingAddress`.
  - Use `COALESCE` to replace NULL `ShippingAddress` values with "Pending".
  - Filter with `WHERE` to identify orders missing addresses.

**SQL Code**:
```sql
%%sql
-- Task 1.2.1 - Identify Orders with Missing Shipping Addresses
SELECT OrderID, COALESCE(ShippingAddress, 'Pending') AS "Shipping Address"
FROM eCommerceOrders
WHERE ShippingAddress IS NULL
```

---

### **Task 1.2.2: Classify Orders by Value**

**Description**: Using `CASE` statements enables categorization within SQL. This task classifies orders as "High Value" or "Regular."

**Project Task**:
- Categorize orders based on `TotalAmount` to flag high-value transactions.
- Helps prioritize customer orders based on their revenue contribution.

**Instructions**:
- **Columns to Use**: `OrderID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `CASE`.
- **Steps**:
  - Use `SELECT` and `CASE` to create a new column named "Order Type".
  - Use `CASE` to categorize orders where `TotalAmount > 500` as "High Value" and others as "Regular".

**SQL Code**:
```sql
%%sql
-- Task 1.2.2 - Classify Orders by Value
SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 500 THEN 'High Value'
           ELSE 'Regular'
       END AS "Order Type"
FROM eCommerceOrders
```

---

### **Task 1.3.1: Concatenate Customer Names**

**Description**: String functions help manipulate text data. Here, we combine first and last names into a full name for improved readability.

**Project Task**:
- Concatenate the customer's first and last name to display a single "Full Name" column.
- Helps streamline customer name display in reports.

**Instructions**:
- **Columns to Use**: `CustomerFirstName`, `CustomerLastName`.
- **Commands to Use**: `SELECT`, `CONCAT`.
- **Steps**:
  - Use `SELECT` and `CONCAT` to merge `CustomerFirstName` and `CustomerLastName`.
  - Assign an alias "Full Name" to the concatenated result.

**SQL Code**:
```sql
%%sql
-- Task 1.3.1 - Concatenate Customer Names
SELECT CustomerID, CONCAT(CustomerFirstName, ' ', CustomerLastName) AS "Full Name"
FROM CustomerDetails
```

---

### **Task 1.3.2: Extract Month from Order Date**

**Description**: Date functions enable time-based analysis. This task extracts the month of each order to help analyze seasonal trends.

**Project Task**:
- Extract the month from `OrderDate` to analyze order distribution by month.
- Helps understand peak sales periods for better stock management.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderDate`.
- **Commands to Use**: `SELECT`, `MONTH`.
- **Steps**:
  - Use `SELECT` and `MONTH` to extract the month part of `OrderDate`.
  - Assign an alias "Order Month" to the extracted value.

**SQL Code**:
```sql
%%sql
-- Task 1.3.2 - Extract Month from Order Date
SELECT OrderID, OrderDate, 
       strftime('%m', OrderDate) AS "Order Month"
FROM eCommerceOrders
```

---

### **Task 1.4.1: Combine Orders and Customer Details with JOIN**

**Description**: Joins allow data integration across tables. This task combines order data with customer details.

**Project Task**:
- Join `eCommerceOrders` with `CustomerDetails` to retrieve customer details for each order.
- Enables a consolidated view of order and customer information.

**Instructions**:
- **Columns to Use**: `OrderID`, `CustomerID`, `CustomerName`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `JOIN`, `ON`.
- **Steps**:
  - Use `SELECT` to choose relevant columns from both tables.
  - Use `JOIN` to combine `eCommerceOrders` with `CustomerDetails` based on `CustomerID`.

**SQL Code**:
```sql
%%sql
-- Task 1.4.1 - Combine Orders and Customer Details with JOIN
SELECT e.OrderID, e.CustomerID, c.CustomerName, e.OrderDate, e.TotalAmount
FROM eCommerceOrders e
JOIN CustomerDetails c ON e.CustomerID = c.CustomerID
ORDER BY e.OrderDate ASC
```

---

### **Task 1.4.2: Union Delivered and Shipped Orders**

**Description**: `UNION` combines result sets vertically. This task combines records for "Delivered" and "Shipped" orders.

**Project Task**:
- Create a unified view of orders with "Delivered" and "Shipped" statuses.
- Provides a combined report of active and completed orders.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderDate`, `OrderStatus`.
- **Commands to Use**: `SELECT`, `UNION`.
- **Steps**:
  - Use `SELECT` to retrieve records with `OrderStatus` "Delivered".
  - Use `UNION` to combine with records where `OrderStatus` is "Shipped".

**SQL Code**:
```sql
%%sql
-- Task 1.4.2 - Union Delivered and Shipped Orders
SELECT OrderID, OrderDate, OrderStatus
FROM eCommerceOrders
WHERE OrderStatus = 'Delivered'
UNION
SELECT OrderID, OrderDate, OrderStatus
FROM eCommerceOrders
WHERE OrderStatus = 'Shipped'
ORDER BY OrderDate ASC
```

---

Certainly! Here’s the continuation, starting with Task 2.1.1 and following the same structure as before.

---

### **Task 2.1.1: Retrieve Top 10 Orders by Quantity**

**Description**: Custom sorting helps prioritize results, making it easier to analyze high-volume orders. This task retrieves the top 10 orders by quantity, helping identify bulk orders.

**Project Task**:
- Retrieve the top 10 orders based on the `Quantity` column.
- Sort results first by `Quantity` in descending order and then by `OrderDate` to prioritize recent large orders.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderDate`, `Quantity`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `ORDER BY`, `LIMIT`.
- **Steps**:
  - Use `SELECT` to retrieve `OrderID`, `OrderDate`, `Quantity`, and `TotalAmount`.
  - Sort by `Quantity` in descending order and then by `OrderDate`.
  - Use `LIMIT` to restrict the output to the top 10 orders.

**SQL Code**:
```sql
%%sql
-- Task 2.1.1 - Retrieve Top 10 Orders by Quantity
SELECT OrderID, OrderDate, Quantity, TotalAmount
FROM eCommerceOrders
ORDER BY Quantity DESC, OrderDate DESC
LIMIT 10
```

---

### **Task 2.1.2: Show Product Categories with High Total Sales**

**Description**: Filtering aggregated data helps in focusing on significant results. This task shows product categories with total sales exceeding $10,000.

**Project Task**:
- Calculate total sales for each product category.
- Filter to display only categories where total sales exceed $10,000 to focus on high-revenue items.

**Instructions**:
- **Columns to Use**: `Category`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `HAVING`.
- **Steps**:
  - Use `SELECT` and `SUM` to calculate total sales per category.
  - Use `GROUP BY` to aggregate data by `Category`.
  - Apply `HAVING` to filter categories with total sales over $10,000.

**SQL Code**:
```sql
%%sql
-- Task 2.1.2 - Show Product Categories with High Total Sales
SELECT Category, SUM(TotalAmount) AS "Total Sales"
FROM eCommerceOrders
GROUP BY Category
HAVING SUM(TotalAmount) > 10000
ORDER BY "Total Sales" DESC
```

---

### **Task 2.2.1: Count Orders per Month**

**Description**: Counting orders by month enables trend analysis over time, helping identify seasonality in sales.

**Project Task**:
- Count the number of orders placed each month to detect peak periods.
- Helps in understanding sales trends and planning inventory or marketing activities.

**Instructions**:
- **Columns to Use**: `OrderDate`.
- **Commands to Use**: `SELECT`, `COUNT`, `GROUP BY`.
- **Steps**:
  - Use `strftime` or equivalent to extract the month and year from `OrderDate`.
  - Use `COUNT` to calculate the number of orders per month.
  - Group by the month and year for accurate monthly counts.

**SQL Code**:
```sql
%%sql
-- Task 2.2.1 - Count Orders per Month
SELECT strftime('%Y-%m', OrderDate) AS "Order Month", COUNT(OrderID) AS "Order Count"
FROM eCommerceOrders
GROUP BY "Order Month"
ORDER BY "Order Month" ASC
```

---

### **Task 2.2.2: Calculate Average Order Value by Payment Method**

**Description**: Calculating the average order value by payment method provides insights into customer payment preferences and spending patterns.

**Project Task**:
- Calculate the average order value for each payment method to understand spending differences.
- Helps optimize payment options and promotional strategies.

**Instructions**:
- **Columns to Use**: `PaymentMethod`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `AVG`, `GROUP BY`.
- **Steps**:
  - Use `SELECT` and `AVG` to calculate the average `TotalAmount` per payment method.
  - Use `GROUP BY` to aggregate results by `PaymentMethod`.

**SQL Code**:
```sql
%%sql
-- Task 2.2.2 - Calculate Average Order Value by Payment Method
SELECT PaymentMethod, AVG(TotalAmount) AS "Average Order Value"
FROM eCommerceOrders
GROUP BY PaymentMethod
ORDER BY "Average Order Value" DESC
```

---

### **Task 2.3.1: Count Orders by Order Status**

**Description**: Counting orders by status provides a snapshot of current order processing stages, helping with fulfillment and customer service planning.

**Project Task**:
- Count the number of orders for each status (e.g., Shipped, Delivered, Canceled).
- Useful for monitoring order progress and managing order flows.

**Instructions**:
- **Columns to Use**: `OrderStatus`.
- **Commands to Use**: `SELECT`, `COUNT`, `GROUP BY`.
- **Steps**:
  - Use `SELECT` and `COUNT` to calculate the total count of orders for each status.
  - Use `GROUP BY` to aggregate data by `OrderStatus`.

**SQL Code**:
```sql
%%sql
-- Task 2.3.1 - Count Orders by Order Status
SELECT OrderStatus, COUNT(OrderID) AS "Order Count"
FROM eCommerceOrders
GROUP BY OrderStatus
ORDER BY "Order Count" DESC
```

---

### **Task 2.3.2: Find Orders with Highest Quantity Per Customer**

**Description**: Finding the highest quantity ordered per customer highlights high-demand customers, useful for targeting repeat customers.

**Project Task**:
- Retrieve the order with the highest quantity for each customer.
- Helps identify customers who frequently place bulk orders.

**Instructions**:
- **Columns to Use**: `CustomerID`, `OrderID`, `Quantity`.
- **Commands to Use**: `SELECT`, `MAX`, `GROUP BY`.
- **Steps**:
  - Use `MAX` to find the highest quantity ordered per customer.
  - Use `GROUP BY` to aggregate results by `CustomerID`.

**SQL Code**:
```sql
%%sql
-- Task 2.3.2 - Find Orders with Highest Quantity Per Customer
SELECT CustomerID, OrderID, MAX(Quantity) AS "Highest Quantity"
FROM eCommerceOrders
GROUP BY CustomerID
ORDER BY "Highest Quantity" DESC
```

---

### **Task 3.1.1: Calculate Total Revenue by Year**

**Description**: Summing revenue by year allows for annual performance comparisons, providing insight into growth trends.

**Project Task**:
- Calculate total revenue for each year.
- Useful for evaluating year-over-year growth and setting financial targets.

**Instructions**:
- **Columns to Use**: `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`.
- **Steps**:
  - Use `SUM` to calculate total `TotalAmount` per year.
  - Use `GROUP BY` to aggregate results by the year extracted from `OrderDate`.

**SQL Code**:
```sql
%%sql
-- Task 3.1.1 - Calculate Total Revenue by Year
SELECT strftime('%Y', OrderDate) AS "Order Year", SUM(TotalAmount) AS "Total Revenue"
FROM eCommerceOrders
GROUP BY "Order Year"
ORDER BY "Order Year" ASC
```

---

### **Task 3.1.2: Count Unique Customers by City**

**Description**: Counting unique customers by city provides geographic insights, helping target regional marketing campaigns.

**Project Task**:
- Count the number of unique customers in each city.
- Useful for understanding customer distribution and regional demand.

**Instructions**:
- **Columns to Use**: `CustomerID`, `City`.
- **Commands to Use**: `SELECT`, `COUNT`, `DISTINCT`, `GROUP BY`.
- **Steps**:
  - Use `COUNT` with `DISTINCT` to count unique customers per city.
  - Use `GROUP BY` to aggregate data by `City`.

**SQL Code**:
```sql
%%sql
-- Task 3.1.2 - Count Unique Customers by City
SELECT City, COUNT(DISTINCT CustomerID) AS "Unique Customers"
FROM CustomerDetails
GROUP BY City
ORDER BY "Unique Customers" DESC
```

---

### **Task 3.2.1: Find Highest Spending Customers**

**Description**: Identifying the highest spending customers helps target top clients for loyalty programs or personalized offers.

**Project Task**:
- Retrieve the top 5 customers by total spending.
- Useful for identifying VIP customers for potential rewards or incentives.

**Instructions**:
- **Columns to Use**: `CustomerID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `SUM`, `GROUP BY`, `ORDER BY`, `LIMIT`.
- **Steps**:
  - Use `SUM` to calculate total spending for each customer.
  - Use `ORDER BY` in descending order and `LIMIT` to get the top 5 customers.

**SQL Code**:
```sql
%%sql
-- Task 3.2.1 - Find Highest Spending Customers
SELECT CustomerID, SUM(TotalAmount) AS "Total Spending"
FROM eCommerceOrders
GROUP BY CustomerID
ORDER BY "Total Spending" DESC
LIMIT 5
```

---