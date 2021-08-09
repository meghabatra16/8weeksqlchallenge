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




#Query 4
--What was the average distance travelled for each customer?
with ctediners as (
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

