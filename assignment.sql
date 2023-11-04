--task1 
SELECT c.customer_id, c.name, c.email, c.location, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.email, c.location
ORDER BY total_orders DESC;

--task2
SELECT p.name AS product_name, oi.quantity, (oi.quantity * oi.unit_price) AS total_amount
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_id ASC;

--task3
SELECT c.name AS category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY c.name
ORDER BY total_revenue DESC;

--task4
SELECT c.name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_purchase_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.name
ORDER BY total_purchase_amount DESC
LIMIT 5;

