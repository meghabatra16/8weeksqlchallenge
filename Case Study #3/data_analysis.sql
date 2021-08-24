/* Data Analysis */

--1.How many customers has Foodie-Fi ever had?
select count(distinct customer_id) as total
from foodiee

| total |
---------
| 1000  |

-------

--2.What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value
select extract(month from start_date) as Months_2020, count(plan_id)
from foodiee
where plan_id = 0
group by extract(month from start_date)

| Months_2020 | count   | 
-------------------------
|    1	      |  88     |
|    2	      |  68     |
|    3	      |  94     |
|    4        |  81     |
|    5	      |  88     |
|    6	      |  79     |
|    7        |  89     |
|    8        |  88     |
|    9        |  87     |
|   10        |  79     |
|   11        |  75     |
|   12        |  84     |

-------

--What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name













