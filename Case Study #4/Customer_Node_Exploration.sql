/* Case Study - 4 */

##1. How many unique nodes are there on the Data Bank system?
select count(distinct(node_id)) from customer_nodes



##2 What is the number of nodes per region?
select region_id, count(distinct node_id) from customer_nodes
group by region_id
order by region_id


##3 How many customers are allocated to each region?
select region_id, count(distinct customer_id) as customers
from customer_nodes
group by region_id

##4 How many days on average are customers reallocated to a different node?


