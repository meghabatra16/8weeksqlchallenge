/* --------------------
   Case Study Questions
   --------------------*/
Query 1

-- 1. What is the total amount each customer spent at the restaurant?
select customer_id, sum(price) 
from sales as s
inner join menu as m
on s.product_id = m.product_id 
group by customer_id
order by customer_id;

| customer_id | sum |
| ----------- | --- |
| A           | 76  |
| B           | 74  |
| C           | 36  |

Query 2

-- 2. How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) 
from sales
group by customer_id;

| customer_id | count |
| ----------- | ----- |
| A           | 4     |
| B           | 6     |
| C           | 2     |

Query 3

--3. What was the first item from the menu purchased by each customer?
select customer_id, m.product_id, m.product_name, order_date
from menu as m
inner join sales as s
on m.product_id = s.product_id
where order_date = '2021-01-01'
order by customer_id;
 
|customer_id | product_id |product_name|   order_date  |
| A	         |     1	    |   "sushi"	 |  "2021-01-01" |
| A	         |     2	    |   "curry"	 |  "2021-01-01" |
| B	         |     2	    |   "curry"	 |  "2021-01-01" |
| C	         |     3	    |   "ramen"	 |  "2021-01-01" |
| C	         |     3	    |    "ramen" |  "2021-01-01" |

Query 4

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

select count(*), me.product_name 
from menu as me
inner join sales as s
on me.product_id = s.product_id
group by product_name
limit 1;

| product_name | count |
| ------------ | ----- |
| ramen        | 8     |


Query 5
-- 5. Which item was the most popular for each customer?

select count(*), s.customer_id, product_name
from sales as s
inner join menu as me
on me.product_id = s.product_id
group by product_name,customer_id
order by count(*) desc
