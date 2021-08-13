/*Price and Rating*/

--If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?

select 
sum(case when pizza_id = 1 then 12 else 10 end ) as earnings
from customer_orders

|earnings|
----------
|160     |

-------

--What if there was an additional $1 charge for any pizza extras? Add cheese is $1 extra

select
sum(case when pizza_id = 1 then 12 else 10 end) +
sum(case when extras is not null then 1 else 0 end) as earnings
from customer_orders

|earnings|
----------
|164     |

-------

--The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.

create table rating(
 customer_id integer,
	order_id integer,
	runner_id integer,
	ratings integer
)

insert into rating
	(customer_id,order_id,runner_id,ratings)
values
	('101','1','1',5),
	('101','2','1',4),
	('102', '3','1',5),
	('103','4','1',4),
	('104', '5' ,'3', 3),
        ('105', '7' ,'2', 5),
        ('102','8', '2', 4),
        ('104', '10', '1', 4);

select * from rating

| CUSTOMER_ID | ORDER_ID | RUNNER_ID | RATING |
| ----------- | -------- | --------- | ------ |
| 101         | 1        | 1         | 5      |
| 101         | 2        | 1         | 4      |
| 102         | 3        | 1         | 5      |
| 103         | 4        | 1         | 4      |
| 104         | 5        | 3         | 3      |
| 105         | 7        | 2         | 5      |
| 102         | 8        | 2         | 4      |
| 104         | 10       | 1         | 4      |


---------

--Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?

select cu.customer_id, 
          cu.order_id, 
		  cu.order_time,
		  r.runner_id,
		  r.pickup_time,
		  extract(minute from avg(cast(r.pickup_time as timestamp) - cu.order_time )) as average,
		  r.duration,
		  ra.ratings,
		  round(avg(cast(distance as decimal)/cast(duration as decimal)),2) as speed,
		  count(*) as total_pizza
		  from customer_orders as cu
		  inner join runner_orders as r
		  on cu.order_id = r.order_id
		  inner join rating as ra
		  on ra.order_id  =  cu.order_id
		  where cancellation is null
		  group by cu.customer_id, cu.order_id, cu.order_time, r.runner_id, r.pickup_time,r.duration, ra.ratings


| customer_id | order_id | order_time              | runner_id   | pickup_time               | average  | duration    |   rating     | avg_speed   | total_pizza |
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
|   103	      |    4	 |  "2020-01-04 13:23:46"  |    2	 |  "2020-01-04 13:53:03"    |	29	|    "40 "    |	   4	     |	0.59	   |	3        |
|   102	      |    8	 |  "2020-01-09 23:54:33"  | 	2	 |  "2020-01-10 00:15:02"    |	20	|    "15 "    |	   4	     |	1.56	   |	1        |
|   101	      |    1	 |  "2020-01-01 18:05:02"  |	1	 |  "2020-01-01 18:15:34"    |	10	|    "32 "    |	   5	     |	0.63	   |	1        |
|   104	      |    10	 |  "2020-01-11 18:34:49"  |	1	 |  "2020-01-11 18:50:20"    |	15	|    "10 "    |	   4	     |	1.00	   |	2        |
|   102	      |    3	 |  "2020-01-02 12:51:23"  |	1	 |  "2020-01-02 00:12:37"    |	-38	|     "20 "   |	   5	     |	0.67	   |	2        |
|   105	      |	  7	 |  "2020-01-08 21:20:29"  |	2	 |  "2020-01-08 21:30:45"    |	10	|     "25 "   |	   5	     |	1.00	   |	1        |
|   104	      |	  5	 |  "2020-01-08 21:00:29"  |	3	 |  "2020-01-08 21:10:57"    |	10	|     "15 "   |	   3	     |	0.67	   |	1        |
|   101	      |	  2	 |  "2020-01-01 19:00:52"  |	1	 |  "2020-01-01 19:10:54"    |	10	|     "27 "   |    4	     |	0.74	   |	1        |

----------

-- If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and 
-- each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?
select 
sum(case when cu.pizza_id = 1 then 12 else 10 end) as earnings,
sum(case when r.duration is not null then 0.30 * cast(r.duration as decimal) else 0 end) as money_spent 
from runner_orders as r
inner join customer_orders as cu
on cu.order_id = r.order_id

| earnings | total_pizza |
| -------- | ----------- |
| 160      | 88.20       |


