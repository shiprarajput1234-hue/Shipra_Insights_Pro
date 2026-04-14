 PRACTICE DATA SET (E-Commerce Scenario)
 
1. Users Table

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(30),
    signup_date DATE
);

INSERT INTO users VALUES
(1, 'Amit', 'amit@gmail.com', 'Delhi', '2023-01-10'),
(2, 'Neha', 'neha@gmail.com', 'Mumbai', '2023-02-15'),
(3, 'Rahul', 'rahul@gmail.com', 'Delhi', '2023-03-20'),
(4, 'Pooja', 'pooja@gmail.com', 'Pune', '2023-04-01'),
(5, 'Karan', NULL, 'Mumbai', '2023-04-10');

🟦 2. Products Table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT
);

INSERT INTO products VALUES
(101, 'Mobile', 'Electronics', 15000),
(102, 'Laptop', 'Electronics', 55000),
(103, 'Shoes', 'Fashion', 2500),
(104, 'Watch', 'Fashion', 4000),
(105, 'Headphones', 'Electronics', 3000);

3. Orders Table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO orders VALUES
(1001, 1, 101, '2023-02-01', 1),
(1002, 2, 103, '2023-02-20', 2),
(1003, 1, 105, '2023-03-10', 1),
(1004, 3, 102, '2023-03-25', 1),
(1005, 4, 104, '2023-04-05', 1);

 4. Payments Table
 
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(20),
    amount INT,
    payment_date DATE
);

INSERT INTO payments VALUES
(501, 1001, 'UPI', 15000, '2023-02-01'),
(502, 1002, 'Card', 5000, '2023-02-20'),
(503, 1003, 'UPI', 3000, '2023-03-10'),
(504, 1004, 'NetBanking', 55000, '2023-03-25'),
(505, 1005, 'Cash', 4000, '2023-04-05');

 PRACTICE QUESTIONS (Use this Data)

BASIC – ANSWERS

1. Display all users

SELECT * 
FROM users;

2. Find users from Mumbai

SELECT * 
FROM users
WHERE city = 'Mumbai';

3. Show products priced above 5000

SELECT * 
FROM products
WHERE price > 5000;

4. Count total users

SELECT COUNT(*) AS total_users
FROM users;

 INTERMEDIATE – ANSWERS
 
5. Find total orders placed by each user

SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id;

6. Show total sales amount

SELECT SUM(amount) AS total_sales
FROM payments;

7. List users who never placed an order

SELECT u.user_id, u.name
FROM users u
LEFT JOIN orders o 
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

8.Find top 3 expensive products

SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;

9. Show total revenue by payment mode

SELECT payment_mode, SUM(amount) AS total_revenue
FROM payments
GROUP BY payment_mode;

 ADVANCED – ANSWERS
 
10. Find users who spent more than average spending

SELECT u.user_id, u.name, SUM(p.amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY u.user_id, u.name
HAVING SUM(p.amount) > (
    SELECT AVG(amount) FROM payments
);

11. Find most purchased product

SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 1;

12. Display monthly revenue

SELECT 
    MONTH(payment_date) AS month,
    SUM(amount) AS monthly_revenue
FROM payments
GROUP BY MONTH(payment_date);

13. Identify duplicate cities

SELECT city, COUNT(*) AS city_count
FROM users
GROUP BY city
HAVING COUNT(*) > 1;

14. Find users with NULL email

SELECT *
FROM users
WHERE email IS NULL;

“I practiced SQL using real-world datasets covering joins, aggregation, subqueries, and business reporting scenarios.”
