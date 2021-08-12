
/* INGREDIENTS OPTIMISATION */

#Query 1
--What are the standard ingredients for each pizza?















#Query 2
--What was the most commonly added extra?
With ctediners as(
select order_id, unnest(string_to_array(extras, ',')) as extra
from customer_orders
where extras is not null
group by order_id, unnest(string_to_array(extras, ','))
)
select max(extra) as commonly_added_extra
from ctediners

|commonly_added_extra |
-----------------------
|     1               |

--------

#Query 3 
What was the most common exclusion?
With ctediners as(
select order_id, unnest(string_to_array(exclusions, ',')) as exclusion
from customer_orders
where exclusions is not null
group by order_id, unnest(string_to_array(exclusions, ','))
)
select max(exclusion) as common_exclusion
from ctediners

|commonly_added_extra |
-----------------------
|     4               |






























