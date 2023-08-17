With CTE as (
    select distinct customer_id, year(order_date) as years, sum(price) over (partition by customer_id, year(order_date) order by year(order_date)) as total_price from orders
    )
select c1.customer_id from CTE c1 left join CTE c2
on c1.customer_id = c2.customer_id and c1.years + 1 = c2.years
and c1.total_price < c2.total_price
group by c1.customer_id
having count(c1.customer_id) - count(c2.customer_id) = 1;