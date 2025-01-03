with cte as (select customer_id, YEAR(order_date) as yr, sum(price) as price
from Orders
group by customer_id,yr
order by customer_id, yr
)

select c1.customer_id 
from cte c1
left join cte c2
on  c1.customer_id =  c2.customer_id
and c1.yr+1=c2.yr and c1.price<c2.price
group by  c1.customer_id
having count(*) - count( c2.customer_id) =1