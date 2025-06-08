# Write your MySQL query statement below
with cte as (
select distinct customer_id,year(order_date) as year,
sum(price) over(partition by customer_id,year(order_date)) as price
from Orders order by customer_id,year)

select 
distinct c1.customer_id
from cte c1
left join cte c2 on c1.customer_id=c2.customer_id
and c1.year +1= c2.year
and c1.price < c2.price
group by c1.customer_id
having count(*)-count(c2.customer_id)=1;
