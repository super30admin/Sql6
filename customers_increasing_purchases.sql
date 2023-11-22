with CTE as (
select
customer_id,
year(order_date) year_of_order,
sum(price) as total_price
from Orders
group by 1,2
)

select c1.customer_id from CTE c1 left join CTE c2
on (c2.year_of_order = c1.year_of_order + 1)
and c1.customer_id = c2.customer_id
and c2.total_price > c1.total_price
group by 1
HAVING COUNT(c1.customer_id) - COUNT(c2.customer_id) = 1;