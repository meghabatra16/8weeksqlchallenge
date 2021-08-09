/* Runner and Customer Experience */

#Query 1
--How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
select to_char(registration_date, 'Week') as W, count(*)
from runners
group by W

|    W    | count|
|----------------|
|1st week |  2   |
|2nd week |  1   |
|3rd week |  1   |

-------

#Query 2
--What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
With ctediners as (
select cu.order_time, r.pickup_time, r.runner_id
from runner_orders as r
inner join customer_orders as cu
on cu.order_id = r.order_id
)
select cte.runner_id, extract(minute from avg(cte.pickup_time - cte.order_time)) as avg_time
from ctediners as cte
where cte.pickup_time is not null
group by cte.runner_id
order by cte.runner_id


| runner_id | avg_time     |
----------------------------
| 1         | 15           |
| 2         | 23           |
| 3         | 10           |

--------

#Query 3
--Is there any relationship between the number of pizzas and how long the order takes to prepare?



















#Query 4
--What was the average distance travelled for each customer?
With ctediners as (
select cu.customer_id, r.pickup_time, r.distance
from runner_orders as r
inner join customer_orders as cu
on cu.order_id = r.order_id
)
select cte.customer_id, round(avg(cast(distance as decimal)),2)
from ctediners as cte
group by cte.customer_id
order by cte.customer_id


| customer_id | round |
-----------------------
| 101         | 20.00 |
| 102         | 16.73 |
| 103         | 23.40 |
| 104         | 10.00 |
| 105         | 25.00 |

--------

#Query 5
--What was the difference between the longest and shortest delivery times for all orders?














#Query 6
--What was the average speed for each runner for each delivery and do you notice any trend for these values?
select runner_id, order_id, round(avg(cast(distance as decimal)/cast(duration as decimal)),2) as speed
from runner_orders
where cancellation is null
group by runner_id, order_id
order by runner_id, order_id

| runner_id | order_id | speed  |
---------------------------------
| 1         | 1        | 0.63   |
| 1         | 2        | 0.74   |
| 1         | 3        | 0.67   |
| 1         | 10       | 1.00   |
| 2         | 4        | 0.59   |
| 2         | 7        | 1.00   |
| 2         | 8        | 1.56   |
| 3         | 5        | 0.67   |
