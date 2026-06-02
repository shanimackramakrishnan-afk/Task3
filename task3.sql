-- Task 3: SQL for Data Analysis

-- 1. Check Data

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;

-- 2. WHERE

SELECT * FROM orders
WHERE order_status = 'delivered';

-- 3. ORDER BY

SELECT * FROM Order_Payments
ORDER BY payment_value DESC;
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders

-- 4. GROUP BY

GROUP BY customer_id;
SELECT order_id, SUM(payment_value) AS total_payment
FROM Order_Payments
GROUP BY order_id;

-- 5. JOIN (2 tables,INNER JOIN)

SELECT c.customer_city, o.order_id
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- 6. JOIN (3 tables)

SELECT o.order_id, oi.product_id, p.payment_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Order_Payments p ON o.order_id = p.order_id;

-- 7. LEFT JOIN 

SELECT o.order_id, p.payment_value
FROM orders o
LEFT JOIN Order_Payments p
ON o.order_id = p.order_id;


-- 8. RIGHT JOIN (SQLite Equivalent)

SELECT o.order_id, p.payment_value
FROM Order_Payments p
LEFT JOIN Orders o
ON p.order_id = o.order_id;


-- 9. Subquery

SELECT customer_id
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
);

-- 10. AVG

SELECT customer_id, AVG(payment_value)
FROM Orders o
JOIN Order_Payments p ON o.order_id = p.order_id
GROUP BY customer_id;


-- 11. SUM

SELECT customer_id, SUM(payment_value) AS total_payment
FROM Orders o
JOIN Order_Payments p
ON o.order_id = p.order_id
GROUP BY customer_id;


-- 12. VIEW

CREATE VIEW customer_revenue AS
SELECT o.customer_id, SUM(p.payment_value) AS total_revenue
FROM Orders o
JOIN Order_Payments p ON o.order_id = p.order_id
GROUP BY o.customer_id;

-- View Output

SELECT * FROM customer_revenue;


-- 13. NULL handling

SELECT IFNULL(payment_value, 0)
FROM Order_Payments;
