WITH CTE AS(
    SELECT customer_id, year(order_date) as order_year, sum(price) as orderSUM 
    FROM orders
    group by customer_id, order_year
),
CTE2 as (
 SELECT *, Rank() over(partition by customer_id order by order_year) as r1 , 
 RANK() over(partition by customer_id order by orderSUM) as r2 
from CTE
)
SELECT customer_id from CTE2 
group by customer_id 
Having SUM(if(r1=r2,1,0)) = MAX(order_year) - MIN(order_year) +1