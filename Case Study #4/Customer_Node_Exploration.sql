/* Case Study - 4 */

##1. How many unique nodes are there on the Data Bank system?
select count(distinct(node_id)) from customer_nodes

##2 What is the number of nodes per region?
select region_id, count(*) from customer_nodes
group by region_id
order by region_id

or


