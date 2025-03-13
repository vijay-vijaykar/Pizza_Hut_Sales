-- ADVANCED QUERIES

-- 1.Calculate the percentage contribution of each pizza type to total revenue.
SELECT pt.category,
round(sum(od.quantity*p.price) /(select round (sum(od.quantity*p.price),2)as total_sales
from order_details as od
join pizzas as p
on p.pizza_id=od.pizza_id)*100,2) as revenue
from pizza_types as pt
join pizzas as p
on pt.pizza_type_id=p.pizza_type_id
join order_details as od
on od.pizza_id=p.pizza_id
group by pt.category
order by revenue desc;


-- 2.Analyze the cumulative revenue generated over time.
select order_date,sum(revenue)over (order by order_date) as cum_revenue
from
(select o.order_date,sum(od.quantity*p.price) as revenue
from order_details as od
join pizzas as p
on od.pizza_id=p.pizza_id
join orders as o
on o.order_id=od.order_id
group by o.order_date) as sales;

-- 3.Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name,category,revenue
from
(select category,name,revenue,rank() over(partition by category order by revenue desc) as rn
from
(select pt.category,pt.name,sum(od.quantity*p.price) as revenue
from pizza_types as pt
join pizzas as p
on pt.pizza_type_id=p.pizza_type_id
join order_details as od
on od.pizza_id=p.pizza_id
group by pt.category,pt.name) as a) as b
where rn <=3;









