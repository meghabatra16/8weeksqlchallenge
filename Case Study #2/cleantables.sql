
/*Data Cleaning*/

--Cleaning table customer_orders
create temp table tempcustomer_orders as (
select *,
case when exclusions = '' then NULL
     when exclusions = 'null' then NULL
	   else exclusions
end as exclusion,
case when extras = '' then NULL
     when extras = ' null' then NULL
	   else extras
end as extra
from customer_orders
	);
  
 
 select * from tempcustomer_orders 
 
| order_id | customer_id | pizza_id | exclusions | extras | order_time               |
--------------------------------------------------------------------------------------
| 1        | 101         | 1        |            |        | 2020-01-01T18:05:02.000Z |
| 2        | 101         | 1        |            |        | 2020-01-01T19:00:52.000Z |
| 3        | 102         | 1        |            |        | 2020-01-02T23:51:23.000Z |
| 3        | 102         | 2        |            |        | 2020-01-02T23:51:23.000Z |
| 4        | 103         | 1        | 4          |        | 2020-01-04T13:23:46.000Z |
| 4        | 103         | 1        | 4          |        | 2020-01-04T13:23:46.000Z |
| 4        | 103         | 2        | 4          |        | 2020-01-04T13:23:46.000Z |
| 5        | 104         | 1        |            | 1      | 2020-01-08T21:00:29.000Z |
| 6        | 101         | 2        |            |        | 2020-01-08T21:03:13.000Z |
| 7        | 105         | 2        |            | 1      | 2020-01-08T21:20:29.000Z |
| 8        | 102         | 1        |            |        | 2020-01-09T23:54:33.000Z |
| 9        | 103         | 1        | 4          | 1, 5   | 2020-01-10T11:22:59.000Z |
| 10       | 104         | 1        |            |        | 2020-01-11T18:34:49.000Z |
| 10       | 104         | 1        | 2, 6       | 1, 4   | 2020-01-11T18:34:49.000Z |


------------


--Cleaning Table runner_orders

drop table if exists temprunner_orders;

create temp table temprunner_orders as (
select *,
case 
	 when cancellation like '' then NULL
     when cancellation like 'null' then NULL
	 else cancellation
     end as cancellations,
case 
	 when pickup_time like 'null' then NULL
	 else pickup_time
     end as pickup,
case 
	 when distance like 'null' then NULL
     when distance like '%km' then trim(trailing 'km' from distance)
	 else distance
     end as distance_km,
case 
	 when duration like 'null' then NULL
         when duration like '%minutes' then trim( trailing 'minutes' from duration)
	 when duration like '%min' then trim(trailing 'min' from duration)
	 else duration 
     end as duration_minutes
from runner_orders);

| order_id | runner_id | pickup_time         | distance | duration | cancellation            |
----------------------------------------------------------------------------------------------
| 1        | 1         | 2020-01-01 18:15:34 | 20       | 32       |                         |
| 2        | 1         | 2020-01-01 19:10:54 | 20       | 27       |                         |
| 3        | 1         | 2020-01-03 00:12:37 | 13.4     | 20       |                         |
| 4        | 2         | 2020-01-04 13:53:03 | 23.4     | 40       |                         |
| 5        | 3         | 2020-01-08 21:10:57 | 10       | 15       |                         |
| 6        | 3         |                     |          |          | Restaurant Cancellation |
| 7        | 2         | 2020-01-08 21:30:45 | 25       | 25       |                         |
| 8        | 2         | 2020-01-10 00:15:02 | 23.4     | 15       |                         |
| 9        | 2         |                     |          |          | Customer Cancellation   |
| 10       | 1         | 2020-01-11 18:50:20 | 10       | 10       |                         |


-----------
