with cte as (
select customer_id ,YEAR(order_date)as years, sum(price) as yearly_price from orders
group by 1,2
)
select y1.customer_id from cte y1 left join cte y2
on y1.customer_id=y2.customer_id and y2.years=y1.years+1 and y1.yearly_price<y2.yearly_price
group by y1.customer_id
having count(*)-count(y2.customer_id)=1