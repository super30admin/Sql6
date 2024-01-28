# Write your MySQL query statement below
With CTE as (
select distinct customer_id, year(order_date) as year, sum(price) over(partition by customer_id, year(order_date) order by year(order_date)) as total from Orders 
)

select c1.customer_id from CTE c1 
left join CTE as c2
on c1.customer_id = c2.customer_id
and c1.year+1 = c2.year and c1.total < c2.total
group by customer_id
having count(*) - count(c2.customer_id) = 1

 