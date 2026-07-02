CREATE DATABASE e_commerce;
USE e_commerce;
SELECT * FROM e_commerce;
SELECT COUNT(*) AS Total_Records FROM e_commerce;
SELECT `Order ID`, Category, Amount FROM e_commerce;
SELECT * FROM e_commerce WHERE Amount > 1000;
SELECT `Order ID`, Amount FROM e_commerce ORDER BY Amount DESC;
SELECT Category, SUM(Amount) AS Total_Sales FROM e_commerce GROUP BY Category;
SELECT AVG(Amount) AS Average_Amount FROM e_commerce;
SELECT MAX(Amount) AS Maximum_Amount FROM e_commerce;
SELECT MIN(Amount) AS Minimum_Amount FROM e_commerce;
SELECT Category, SUM(Amount) AS Total_Sales FROM e_commerce GROUP BY Category HAVING SUM(Amount) > 100000;
SELECT * FROM e_commerce WHERE Amount >
(
    SELECT AVG(Amount)
    FROM e_commerce
);
CREATE VIEW High_Value_Orders AS SELECT * FROM e_commerce WHERE Amount > 1000;
SELECT * FROM High_Value_Orders;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Dev', 'Chennai'),
(2, 'Suba', 'Bangalore'),
(3, 'Sneha', 'Hyderabad'),
(4, 'Rithick', 'Mumbai'),
(5, 'Riya', 'Delhi');
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);
INSERT INTO orders (order_id, customer_id, amount) VALUES
(101, 1, 2500),
(102, 2, 1800),
(103, 3, 3200),
(104, 1, 1500),
(105, 5, 2800);
SELECT
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id;
SELECT
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id;
SELECT
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers RIGHT JOIN orders ON customers.customer_id = orders.customer_id;