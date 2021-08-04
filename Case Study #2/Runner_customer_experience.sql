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




