--Customers with Strictly Increasing Purchases	


with cte as(select customer_id, substr(order_date,1,4) as o_date, 
sum(price) as total from orders group by o_date,customer_id)
select a.customer_id from CTE a left join CTE b 
on a.customer_id=b.customer_id and a.o_date +1= b.o_date and a.total<b.total 
group by a.customer_id 
having count(distinct b.o_date)= max(a.o_date)-min(a.o_date)