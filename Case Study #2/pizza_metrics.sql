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
where cancellation is null
group by  runner_id;

| runner_id | count |
| --------- | ----- |
| 1         | 4     |
| 2         | 3     |
| 3         | 1     |

------

##Query 4
How many of each type of pizza was delivered?



