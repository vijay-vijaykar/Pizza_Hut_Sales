-- BASIC QUESTIONS--------------

-- 1.Retrieve the total number of orders placed.
SELECT 
    COUNT(*) AS total_no_of_orders
FROM
    orders;

-- 2.Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
FROM
    order_details AS o
        JOIN
    pizzas AS p ON o.pizza_id = p.pizza_id;

-- 3.Identify the highest-priced pizza.
SELECT 
    pt.name, p.price
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- 4.Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(o.order_details_id) AS ordered
FROM
    order_details AS o
        JOIN
    pizzas AS p ON o.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY ordered DESC;

-- 5.List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name, p.pizza_type_id, SUM(o.quantity) AS quantities
FROM
    pizzas AS p
        JOIN
    order_details AS o ON p.pizza_id = o.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY p.pizza_type_id , pt.name
ORDER BY quantities DESC
LIMIT 5;