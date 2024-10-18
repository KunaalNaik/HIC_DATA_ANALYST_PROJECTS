# HIC_CUSTOMER1_RFM_DA3

### Task 1: Data Preparation

---

### Task 1-1: Import the Dataset

- **Description**: In this task, you'll load the dataset from the file in the root directory named `rfm_data.csv` and assign it to the variable `df`.

- **Code Instructions**:
  1. Import the dataset using the path `'./rfm_data.csv'` and assign it to `df`.

```python
import pandas as pd

# Step 1-1: Import the dataset
df = pd.read_csv('./rfm_data.csv')
```

---

### Task 1-2: Check for Missing Values

- **Description**: In this task, you'll identify any missing data in key columns such as `Last Purchase Date`, `Total Number of Purchases`, and `Total Spend (Monetary Value)`.

- **Code Instructions**:
  1. Check for missing values and store the result in a variable.

```python
# Step 1-2: Check for missing values (store the result in a variable)
missing_values = df.isnull().sum()
```

---

### Task 1-3: Handle Missing Values

- **Description**: In this task, you'll handle any missing values by filling them in the `Total Spend (Monetary Value)` column with the median value.

- **Code Instructions**:
  1. Fill missing values in the `Total Spend (Monetary Value)` column with the median.

```python
# Step 1-3: Handle missing values
df['Total Spend (Monetary Value)'].fillna(df['Total Spend (Monetary Value)'].median(), inplace=True)
```

---

### Task 1-4: Convert Date Columns

- **Description**: In this task, you'll ensure that the `Last Purchase Date` and `Account Created Date` columns are in the correct `datetime` format.

- **Code Instructions**:
  1. Convert the `Last Purchase Date` and `Account Created Date` columns to `datetime` format.

```python
# Step 1-4: Convert 'Last Purchase Date' and 'Account Created Date' to datetime format
df['Last Purchase Date'] = pd.to_datetime(df['Last Purchase Date'], errors='coerce')
df['Account Created Date'] = pd.to_datetime(df['Account Created Date'], errors='coerce')
```

---

### Task 1-5: Handle Outliers

- **Description**: In this task, you'll cap extremely high values in `Total Spend (Monetary Value)` to a maximum of 5000 to prevent them from skewing the analysis.

- **Code Instructions**:
  1. Cap `Total Spend (Monetary Value)` at 5000 to handle outliers.

```python
import numpy as np

# Step 1-5: Handle outliers in 'Total Spend (Monetary Value)'
df['Total Spend (Monetary Value)'] = np.where(df['Total Spend (Monetary Value)'] > 5000, 5000, df['Total Spend (Monetary Value)'])
```

---
### Task 2: Calculating Recency

- **Description**: In this task, you'll calculate the recency of each customer by measuring how long it has been since their last purchase. Customers who made recent purchases are more likely to engage again, and we need to store this as a new column called `Recency` (in days).

- **Code Instructions**:
  1. Set a reference date (e.g., today’s date) to calculate the difference between the current date and the customer’s `Last Purchase Date`.
  2. Calculate the time difference in days and store it in a new column called `Recency`.

```python
import pandas as pd

# Step 2-1: Set reference date (e.g., today's date)
reference_date = pd.Timestamp('2024-10-07')  # Adjust this based on your analysis date

# Step 2-2: Calculate recency (difference in days between reference date and Last Purchase Date)
df['Recency'] = (reference_date - df['Last Purchase Date']).dt.days
```
---
### Task 3: Calculating Frequency

- **Description**: In this task, you'll calculate how frequently a customer has made purchases during the analysis period. Customers who purchase more frequently are more engaged, and this value is already available in the dataset in the `Total Number of Purchases` column.

- **Code Instructions**:
  1. Simply copy the `Total Number of Purchases` column to a new column called `Frequency` to represent how often the customer has purchased.

```python
# Step 3: Copy 'Total Number of Purchases' to a new column called 'Frequency'
df['Frequency'] = df['Total Number of Purchases']
```
---
### Task 4: Calculating Monetary Value

- **Description**: In this task, you'll calculate how much each customer has spent. This value is already available in the dataset as `Total Spend (Monetary Value)`. The goal is to ensure it's properly handled for RFM segmentation.

- **Code Instructions**:
  1. Copy the `Total Spend (Monetary Value)` column to a new column called `Monetary`, which will represent how much the customer has spent.

```python
# Step 4: Copy 'Total Spend (Monetary Value)' to a new column called 'Monetary'
df['Monetary'] = df['Total Spend (Monetary Value)']
```
---
### Task 5: Assigning RFM Scores

- **Description**: In this task, you'll assign scores for Recency, Frequency, and Monetary based on quartiles. The highest quartile (4) should represent the best behavior: most recent purchases, highest frequency, and highest monetary value. You'll combine these scores into a single `RFM_Score`.

- **Code Instructions**:
  1. Use `pd.qcut()` to assign quartile-based scores (1 to 4) for `Recency`, `Frequency`, and `Monetary`.
  2. For `Recency`, reverse the scoring so that a more recent purchase gets a higher score.
  3. Combine the three scores into a new column `RFM_Score`.

```python
# Step 5-1: Assign scores based on quartiles (1 to 4) for each R, F, and M
df['R_Score'] = pd.qcut(df['Recency'], 4, labels=[4, 3, 2, 1])  # Higher score for most recent (4 is best)
df['F_Score'] = pd.qcut(df['Frequency'], 4, labels=[1, 2, 3, 4])  # Higher score for more frequent (4 is best)
df['M_Score'] = pd.qcut(df['Monetary'], 4, labels=[1, 2, 3, 4])  # Higher score for higher spend (4 is best)

# Step 5-2: Combine the scores into a single RFM score
df['RFM_Score'] = df['R_Score'].astype(str) + df['F_Score'].astype(str) + df['M_Score'].astype(str)
```
---
You're right—the issue likely lies in the way the conditions are being evaluated. When using `apply()` in pandas, the `R_Score`, `F_Score`, and `M_Score` columns are actually stored as `Categorical` objects (due to the `pd.qcut()` method), and comparing them using the string `'4'` won't work as expected.

To fix this, we need to cast the values to integers before applying the conditions, so the logic works correctly.

Here's the corrected code:

### Task 6: Segmenting Customers (Fixed)

- **Description**: In this task, you'll segment customers based on their RFM scores into meaningful groups. The logic has been fixed by casting the scores to integers to ensure the conditions are evaluated properly.

- **Code Instructions**:
  1. Define clear rules for each customer segment:
     - **Best Customers**: Customers who score 4 in **all three categories** (Recency, Frequency, and Monetary).
     - **Loyal Customers**: Customers with a **high Recency score (R_Score = 4)**, regardless of their Frequency or Monetary score.
     - **Churned Customers**: Customers with **low Recency (R_Score = 1)** and **low Frequency (F_Score = 1)**.
     - **High-Spending Customers**: Customers with a **high Monetary score (M_Score = 4)**.
     - **Other**: Any customers who don’t fit into the above segments.
  2. Assign each customer to a segment and store the result in a new column called `Customer_Segment`.

```python
# Step 6: Define updated segmentation based on RFM scores, ensuring correct type casting
def segment_customers(df):
    if int(df['R_Score']) == 4 and int(df['F_Score']) == 4 and int(df['M_Score']) == 4:
        return 'Best Customer'  # Best in Recency, Frequency, and Monetary
    elif int(df['R_Score']) == 4:
        return 'Loyal Customer'  # Most recent purchases (R_Score = 4)
    elif int(df['R_Score']) == 1 and int(df['F_Score']) == 1:
        return 'Churned Customer'  # Low Recency and Frequency (R_Score = 1, F_Score = 1)
    elif int(df['M_Score']) == 4:
        return 'High-Spending Customer'  # High spenders (M_Score = 4)
    else:
        return 'Other'  # Default group for customers who don't fit the above categories

# Apply segmentation to each customer
df['Customer_Segment'] = df.apply(segment_customers, axis=1)
```

### Explanation:
- **Casting to Integers**: By using `int(df['R_Score'])`, `int(df['F_Score'])`, and `int(df['M_Score'])`, we ensure that the values are correctly compared as integers.
- **Logical Conditions**: The segmentation rules are applied correctly once we convert the categorical values into integers, allowing the conditions to work as expected.
---
### Task 7: Counting Customer Segments

- **Description**: In this task, you'll count how many customers fall into each segment. This will help you understand the distribution of your customer base across the different segments.

- **Code Instructions**:
  1. Group the data by `Customer_Segment` to count the number of customers in each segment.
  2. Store the result in a variable for further analysis or reporting.

```python
# Step 7: Count the number of customers in each segment
segment_counts = df['Customer_Segment'].value_counts().reset_index()
segment_counts.columns = ['Customer_Segment', 'Count']

# Store the result in a variable for future use
segment_counts
```
### Explanation:
1. **Counting Segments**: The code groups the customers by their assigned segment (`Customer_Segment`) and counts how many customers belong to each segment using `value_counts()`.
2. **Results**: The result is stored in `segment_counts` and provides a summary of the number of customers in each category (Best Customer, Loyal Customer, Churned Customer, High-Spending Customer, and Other).
---
### Task 8: Calculate Total Order Value per Segment

- **Description**: In this task, you'll calculate the total order value for each customer segment. This helps to understand the revenue contribution of each segment, allowing for more focused marketing efforts.

- **Code Instructions**:
  1. Group the data by `Customer_Segment`.
  2. Sum the `Monetary` values for each segment to calculate the total order value.
  3. Store the result in a variable for further analysis.

```python
# Step 8: Calculate total order value (Monetary) per segment
total_order_value_per_segment = df.groupby('Customer_Segment')['Monetary'].sum().reset_index()
total_order_value_per_segment.columns = ['Customer_Segment', 'Total Order Value']

# Store the result for future use
total_order_value_per_segment
```

### Explanation:
1. **Grouping by Segment**: The code groups the customers based on their segment using the `groupby()` function.
2. **Summing Monetary Values**: For each segment, the code sums the `Monetary` values to calculate the total order value contributed by that segment.
3. **Results**: The result is stored in `total_order_value_per_segment`, showing how much revenue each customer segment has generated.
---
### Task 9: Calculate Average Number of Order Days per Segment

- **Description**: In this task, you'll calculate the average number of order days (frequency) for each customer segment. This helps you understand how frequently customers in each segment make purchases, providing insight into engagement levels.

- **Code Instructions**:
  1. Group the data by `Customer_Segment`.
  2. Calculate the average `Frequency` for each segment to represent the average number of order days.
  3. Store the result in a variable for further analysis.

```python
# Step 9: Calculate the average number of order days (Frequency) per segment
avg_order_days_per_segment = df.groupby('Customer_Segment')['Frequency'].mean().reset_index()
avg_order_days_per_segment.columns = ['Customer_Segment', 'Average Order Days']

# Store the result for future use
avg_order_days_per_segment
```

### Explanation:
1. **Grouping by Segment**: The data is grouped by the `Customer_Segment`.
2. **Calculating Average Frequency**: The `Frequency` column is averaged for each segment to represent how often customers in each segment make purchases.
3. **Results**: The result is stored in `avg_order_days_per_segment`, showing the average number of order days (frequency) for each segment.

---
### Task 10: Calculate Days Since Last Order (Recency) per Segment

- **Description**: In this task, you'll calculate the average number of days since the last order (Recency) for each customer segment. This provides insight into how recently customers in each segment made a purchase, helping to identify which segments are most engaged or at risk of churn.

- **Code Instructions**:
  1. Group the data by `Customer_Segment`.
  2. Calculate the average `Recency` (days since last order) for each segment.
  3. Store the result in a variable for further analysis.

```python
# Step 10: Calculate the average days since last order (Recency) per segment
avg_recency_per_segment = df.groupby('Customer_Segment')['Recency'].mean().reset_index()
avg_recency_per_segment.columns = ['Customer_Segment', 'Average Days Since Last Order']

# Store the result for future use
avg_recency_per_segment
```

### Explanation:
1. **Grouping by Segment**: The data is grouped by `Customer_Segment`.
2. **Calculating Average Recency**: The average `Recency` is calculated for each segment to determine how many days, on average, have passed since the customers in that segment last made a purchase.
3. **Results**: The result is stored in `avg_recency_per_segment`, showing the average days since the last order for each customer segment.
---
### Task 11: Combine Results into a Final Summary Table

- **Description**: In this task, you'll combine the various metrics calculated (segment size, total order value, average order days, and average recency) into a single summary table. This table provides a comprehensive view of each segment's behavior and contribution.

- **Code Instructions**:
  1. Merge the previously calculated results: segment size, total order value, average order days, and average recency.
  2. Store the combined result in a summary table for easy analysis.

```python
# Step 11: Merge all the calculated metrics into a final summary table

# Merging segment counts with total order value
summary_table = segment_counts.merge(total_order_value_per_segment, on='Customer_Segment')

# Merging with average order days
summary_table = summary_table.merge(avg_order_days_per_segment, on='Customer_Segment')

# Merging with average recency
summary_table = summary_table.merge(avg_recency_per_segment, on='Customer_Segment')

# Store the final summary table for future use
summary_table
```

### Explanation:
1. **Merging Results**: The code merges the segment counts, total order value, average order days, and average recency into a single table, using the `Customer_Segment` as the key for merging.
2. **Final Summary**: The result is stored in `summary_table`, which provides a detailed view of each customer segment, including the number of customers, total revenue contribution, frequency of purchases, and how recently customers made a purchase.
---