import pandas as pd
import random
from faker import Faker
from datetime import datetime, timedelta

# Initialize Faker and set seed for reproducibility
fake = Faker()
Faker.seed(0)
random.seed(0)

# Define product categories and sample products for variety
categories = ["Electronics", "Clothing", "Home Appliances", "Books", "Beauty", "Toys"]
products = {
    "Electronics": ["Laptop", "Smartphone", "Tablet", "Headphones", "Smartwatch"],
    "Clothing": ["T-shirt", "Jeans", "Jacket", "Sneakers", "Dress"],
    "Home Appliances": ["Blender", "Microwave", "Vacuum Cleaner", "Refrigerator", "Air Conditioner"],
    "Books": ["Fiction", "Non-Fiction", "Science", "Biography", "Children"],
    "Beauty": ["Lipstick", "Perfume", "Moisturizer", "Facewash", "Shampoo"],
    "Toys": ["Puzzle", "Lego Set", "Doll", "Toy Car", "Board Game"]
}

# Define order status and payment method distributions
order_status_dist = ["Delivered", "Shipped", "Canceled"]
payment_method_dist = ["Credit Card", "PayPal", "Cash"]

# Generate the data
data = []
for i in range(10000):
    order_id = f"ORD{str(i).zfill(7)}"
    customer_id = f"CUST{random.randint(1, 2000):04d}"
    customer_name = fake.name()
    order_date = fake.date_between(start_date='-1y', end_date='today')
    
    # Randomly select product details based on category
    category = random.choice(categories)
    product_name = random.choice(products[category])
    product_id = f"PROD{random.randint(1, 500):04d}"
    quantity = random.choices([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], weights=[30, 25, 15, 10, 7, 5, 3, 2, 2, 1])[0]
    price = round(random.gauss(100, 50), 2)  # Normally distributed price around $100
    total_amount = round(quantity * price, 2)
    order_status = random.choices(order_status_dist, weights=[70, 20, 10])[0]
    payment_method = random.choices(payment_method_dist, weights=[50, 30, 20])[0]
    shipping_address = fake.address().replace("\n", ", ")

    # Append to data list
    data.append([
        order_id, customer_id, customer_name, order_date, product_id,
        product_name, quantity, price, total_amount, category,
        order_status, payment_method, shipping_address
    ])

# Create DataFrame
columns = [
    "OrderID", "CustomerID", "CustomerName", "OrderDate", "ProductID",
    "ProductName", "Quantity", "Price", "TotalAmount", "Category",
    "OrderStatus", "PaymentMethod", "ShippingAddress"
]
df = pd.DataFrame(data, columns=columns)

# Save to CSV for uploading to SQL if needed
df.to_csv('eCommerceOrders.csv', index=False)
