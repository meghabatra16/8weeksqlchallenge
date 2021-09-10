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

select plan_id, plan_name, extract(year from start_date) as year, count(plan_name)
from foodiee
where extract(year from start_date) = 2021
group by extract(year from start_date), plan_name, plan_id

|plan_id| Plan_name.      | year  | count  |
--------------------------------------------
| 1     |	"basic monthly"	| 2021  | 	8    |
| 4	    | "churn".        |	2021  | 	71   |
| 3	    | "pro annual"	  | 2021  |	  63   |
| 2	    | "pro monthly"	  | 2021  |	  60   |

--------

--What is the customer count and percentage of customers who have churned rounded to 1 decimal place?

select round(100*sum(case when plan_id = 4 then 1 end)/count(distinct customer_id),1) as percentage,
count(case when plan_id = 4 then 1 end) as total
from subscriptions

| percentage | Total |
----------------------
|  30.0      | 307   |


---------


--How many customers have upgraded to an annual plan in 2020?

select extract(year from start_date) as years, count(customer_id) 
from foodiee 
where plan_id = 3 and extract(year from start_date) = 2020
group by extract(year from start_date)


| years      | count |
----------------------
|  2020      | 195   |


---------








