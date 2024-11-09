**Course Name**: **"SQL for Data Analysis: Real-World Projects with eCommerce Data"**

**Tags**: `#SQLBasics`, `#DataAnalysis`, `#BeginnerToAdvanced`, `#eCommerceData`, `#SQLProjects`, `#DataRetrieval`, `#SQLQueries`, `#DataManipulation`, `#SQLJoins`, `#OrderAnalytics`, `#CustomerInsights`, `#InventoryManagement`, `#SalesTrends`, `#BusinessIntelligence`, `#HandsOnSQL`, `#RealWorldSQL`, `#DataScienceFundamentals`

**Course Description**:
This course is a hands-on SQL learning experience, designed to take learners from beginner to advanced SQL skills through real-world eCommerce data projects. Each project simulates essential business tasks such as customer analysis, sales trends, and inventory management, providing learners with practical skills they can directly apply in real-world data scenarios.

---

### **Task 1.1.1: Retrieve Orders by a Specific Customer**

**Description**: This task helps in identifying all the orders placed by a particular customer, which is useful for analyzing customer purchasing behavior and customer service follow-up.

**Project Task**:
- Retrieve details of all orders placed by a single customer to gain insights into their purchasing frequency and preferences.
- This information can help in crafting personalized offers or customer retention strategies.

**Instructions**:
- **Columns to Use**: `CustomerID`, `CustomerName`, `OrderID`, `OrderDate`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`.
- **Steps**:
  - Use the `SELECT` statement to retrieve columns relevant to customer and order details.
  - Filter the records by a specific `CustomerID`.
  - Sort by `OrderDate` if needed for chronological order.

**SQL Code**:
```sql
%%sql
-- Task 1.1.1 - Retrieve Orders by a Specific Customer
SELECT CustomerID, CustomerName, OrderID, OrderDate, TotalAmount
FROM eCommerceOrders
WHERE CustomerID = 'CUST0001'  -- Replace with specific CustomerID
ORDER BY OrderDate ASC
```

---

### **Task 1.1.2: List Products in a Specific Category**

**Description**: Understanding the products within a specific category helps in category-based analysis, such as identifying top sellers and managing inventory.

**Project Task**:
- Retrieve a list of products within a specific category, such as "Electronics."
- This helps in understanding the product lineup, inventory requirements, and potential sales trends within that category.

**Instructions**:
- **Columns to Use**: `ProductID`, `ProductName`, `Category`, `Price`.
- **Commands to Use**: `SELECT`, `WHERE`.
- **Steps**:
  - Use the `SELECT` statement to retrieve columns with product details.
  - Filter by `Category` to get products within a particular category, such as 'Electronics'.

**SQL Code**:
```sql
%%sql
-- Task 1.1.2 - List Products in a Specific Category
SELECT ProductID, ProductName, Category, Price
FROM eCommerceOrders
WHERE Category = 'Electronics'  -- Replace with desired category
ORDER BY ProductName ASC
```

---

### **Task 1.1.3: List Recent Orders**

**Description**: Analyzing recent orders is essential for understanding current demand and sales trends, helping businesses optimize stock and marketing efforts.

**Project Task**:
- Identify and retrieve a list of recent orders placed within the last month.
- This task helps the business stay updated on current purchasing patterns and detect any seasonal trends.

**Instructions**:
- **Columns to Use**: `OrderID`, `OrderDate`, `CustomerID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `ORDER BY`.
- **Steps**:
  - Use the `SELECT` statement to fetch order details.
  - Filter for orders within the past month by comparing `OrderDate`.
  - Sort by `OrderDate` in descending order to get the most recent orders at the top.

**SQL Code**:
```sql
%%sql
-- Task 1.1.3 - List Recent Orders
SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM eCommerceOrders
WHERE OrderDate >= DATE('now', '-1 month')  -- Last month filter
ORDER BY OrderDate DESC
```

---

### **Task 2.2.1: Identify High-Value Orders**

**Description**: Finding orders with high values helps in targeting premium customers and understanding the types of products that drive significant revenue.

**Project Task**:
- Retrieve a list of orders where the `TotalAmount` exceeds $500.
- This allows the business to focus on high-value transactions and identify top-spending customers for targeted marketing.

**Instructions**:
- **Columns to Use**: `CustomerID`, `CustomerName`, `OrderID`, `TotalAmount`.
- **Commands to Use**: `SELECT`, `WHERE`, `ORDER BY`.
- **Steps**:
  - Use the `SELECT` statement to fetch customer and order details.
  - Filter for orders where `TotalAmount` exceeds a defined threshold, e.g., $500.
  - Sort by `TotalAmount` in descending order to highlight the highest-value orders.

**SQL Code**:
```sql
%%sql
-- Task 2.2.1 - Identify High-Value Orders
SELECT CustomerID, CustomerName, OrderID, TotalAmount
FROM eCommerceOrders
WHERE TotalAmount > 500
ORDER BY TotalAmount DESC
```

---

### **Task 2.2.2: Retrieve Top Ordered Products**

**Description**: Identifying the most ordered products is crucial for stock management and marketing, allowing focus on popular products.

**Project Task**:
- List the top 5 most frequently ordered products.
- This task helps in identifying popular items, which can guide restocking and promotional strategies.

**Instructions**:
- **Columns to Use**: `ProductID`, `ProductName`, `Quantity`.
- **Commands to Use**: `SELECT`, `ORDER BY`, `LIMIT`.
- **Steps**:
  - Use `SELECT` to get product details and total quantities ordered.
  - Sort by `Quantity` in descending order to show the most ordered products.
  - Use `LIMIT` to display only the top 5.

**SQL Code**:
```sql
%%sql
-- Task 2.2.2 - Retrieve Top Ordered Products
SELECT ProductID, ProductName, SUM(Quantity) as TotalQuantity
FROM eCommerceOrders
GROUP BY ProductID, ProductName
ORDER BY TotalQuantity DESC
LIMIT 5
```

---

This format includes **Project Task** in bullet points to provide a clear, actionable context for each task, making it easy for learners to understand the relevance and goal of each project. Let me know if this works, and I can apply it to the remaining tasks.