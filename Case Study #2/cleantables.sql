
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

create temp table temprunner_orders as 
select *,
case when cancellation = '' then NULL
     when cancellation = 'null' then NULL
	 else cancellation
end as cancellations,
case when pickup_time = 'null' then NULL
	 else pickup_time
end as pickup_time
case when distance = 'null' then NULL
     when distance = '%km' then
case when duration = 'null' then NULL
     when duration = '%minutes' then 
	 
from runner_orders


