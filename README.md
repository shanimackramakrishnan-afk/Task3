# Task 3: SQL for Data Analysis

## Objective
The objective of this task is to use SQL queries to extract, manipulate, and analyze data from an Ecommerce database. This task demonstrates the practical application of SQL concepts such as filtering, sorting, grouping, joins, subqueries, aggregate functions, views, and null value handling.

---

## Tools Used

- SQLite
- SQLite Online Editor / DB Browser for SQLite
- GitHub

---

## Dataset

The Ecommerce database contains the following tables:

- Customers
- Orders
- Order_Items
- Order_Payments

These tables were used to perform various SQL operations and generate meaningful insights from the data.

---

## Tasks Performed

### 1. Data Inspection

Displayed all records from the main tables to understand the dataset structure.

```sql
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
```

---

### 2. WHERE Clause

Filtered records to retrieve only delivered orders.

```sql
SELECT * FROM Orders
WHERE order_status = 'delivered';
```

---

### 3. ORDER BY Clause

Sorted payment records in descending order of payment value.

```sql
SELECT * FROM Order_Payments
ORDER BY payment_value DESC;
```

---

### 4. GROUP BY Clause

Counted the number of orders placed by each customer.

```sql
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;
```

Calculated total payment for each order.

```sql
SELECT order_id, SUM(payment_value) AS total_payment
FROM Order_Payments
GROUP BY order_id;
```

---

### 5. INNER JOIN

Combined Customers and Orders tables to display customer cities along with order IDs.

```sql
SELECT c.customer_city, o.order_id
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;
```

---

### 6. JOIN Using Three Tables

Combined Orders, Order_Items, and Order_Payments tables to retrieve order, product, and payment information.

```sql
SELECT o.order_id, oi.product_id, p.payment_value
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Order_Payments p
ON o.order_id = p.order_id;
```

---

### 7. LEFT JOIN

Displayed all orders along with their payment information if available.

```sql
SELECT o.order_id, p.payment_value
FROM Orders o
LEFT JOIN Order_Payments p
ON o.order_id = p.order_id;
```

---

### 8. RIGHT JOIN (SQLite Equivalent)

SQLite does not support RIGHT JOIN directly. The equivalent result was achieved using LEFT JOIN by reversing the table order.

```sql
SELECT o.order_id, p.payment_value
FROM Order_Payments p
LEFT JOIN Orders o
ON p.order_id = o.order_id;
```

---

### 9. Subquery

Retrieved customer IDs that have placed at least one order.

```sql
SELECT customer_id
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
);
```

---

### 10. AVG Aggregate Function

Calculated the average payment value made by each customer.

```sql
SELECT customer_id, AVG(payment_value) AS average_payment
FROM Orders o
JOIN Order_Payments p
ON o.order_id = p.order_id
GROUP BY customer_id;
```

---

### 11. SUM Aggregate Function

Calculated the total amount spent by each customer.

```sql
SELECT customer_id, SUM(payment_value) AS total_payment
FROM Orders o
JOIN Order_Payments p
ON o.order_id = p.order_id
GROUP BY customer_id;
```

---

### 12. VIEW Creation

Created a view to store customer revenue information for future analysis.

```sql
CREATE VIEW customer_revenue AS
SELECT o.customer_id,
       SUM(p.payment_value) AS total_revenue
FROM Orders o
JOIN Order_Payments p
ON o.order_id = p.order_id
GROUP BY o.customer_id;
```

Displayed the contents of the view.

```sql
SELECT * FROM customer_revenue;
```

---

### 13. NULL Handling

Replaced NULL values with 0 using IFNULL().

```sql
SELECT IFNULL(payment_value, 0)
FROM Order_Payments;
```

---

## Key SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- COUNT()
- SUM()
- AVG()
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN Equivalent in SQLite
- Subqueries
- Views
- NULL Handling using IFNULL()

---

## Results

Successfully executed SQL queries to:

- Filter records using conditions
- Sort data in ascending and descending order
- Group records and perform aggregate calculations
- Combine data from multiple tables using joins
- Retrieve data using subqueries
- Create reusable views
- Handle NULL values efficiently

---

## Learning Outcomes

By completing this task, I learned:

- How to query structured data using SQL.
- How to combine data from multiple tables using joins.
- How to use aggregate functions such as COUNT(), SUM(), and AVG().
- How to create and use views for analysis.
- How to write subqueries for advanced filtering.
- How to handle missing values in SQL.
- How SQLite differs from other databases regarding RIGHT JOIN support.

---