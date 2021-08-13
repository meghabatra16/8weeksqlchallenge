/*Price and Rating*/

--If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?

select 
sum(case when pizza_id = 1 then 12 else 10 
    case when extras = ) as earnings
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


