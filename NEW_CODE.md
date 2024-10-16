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
