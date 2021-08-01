/*Pizza Metric*/

##Query 1

--How many pizzas were ordered?
select count(*) as Totalpizzas 
from customer_orders;

| Totalpizzas          |
| -------------------- |
| 14                   |

------

##Query 2

--How many unique customer orders were made?
select count(distinct order_time) as unique_orders
from customer_orders;

| unique_orders        |
| -------------------- |
| 10                   |

-------

##Query 3

--How many successful orders were delivered by each runner?
select runner_id, count(*)
from runner_orders
where cancellation = 'null'
group by  runner_id;

| runner_id | count |
| --------- | ----- |
| 1         | 4     |
| 2         | 3     |
| 3         | 1     |

------

##Query 4

--How many of each type of pizza was delivered?
With ctepizza as (
select pi.pizza_name, cu.* from  
customer_orders as cu
inner join pizza_names as pi
on pi.pizza_id = cu.pizza_id
)
select cte.pizza_name, cte.pizza_id, count(*)
from ctepizza as cte
inner join runner_orders as r
on r.order_id = cte.order_id
where cancellation = 'null'
group by pizza_id, pizza_name

| pizza_id | pizza_name | count |
| -------- | ---------- | ----- |
| 1        | Meatlovers | 10    |
| 2        | Vegetarian | 3     |

------

##Query 5

--How many Vegetarian and Meatlovers were ordered by each customer?
With ctepizza as (
select pi.pizza_name, cu.* from  
customer_orders as cu
inner join pizza_names as pi
on pi.pizza_id = cu.pizza_id
)
select cte.customer_id,
sum(case when cte.pizza_id = 1 then 1 else 0 end) as "Meatlovers",
sum(case when cte.pizza_id = 2 then 1 else 0 end) as "Vegetarian"
from ctepizza as cte
group by  customer_id
order by customer_id;

| customer_id | MEATLOVERS | VEGETARIAN |
| ----------- | ---------- | ---------- |
| 101         | 2          | 1          |
| 102         | 3          | 1          |
| 103         | 3          | 1          |
| 104         | 3          | 0          |
| 105         | 0          | 1          |

-------

##Query 6
--What was the maximum number of pizzas delivered in a single order?
With ctepizza as (
select cu.customer_id, cu.pizza_id, r.* from  
customer_orders as cu
inner join runner_orders as r
on r.order_id = cu.order_id
)
select cte.order_id, count(*) as Max_pizza
from ctepizza as cte
group by  order_id
order by max_pizza desc
limit 2;

| order_id | max_pizzas_delivered |
| -------- | -------------------- |
| 4        | 3                    |
| 3        | 3                    |

-------

#Query 7
--For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
