/*
1. We maintain a CTE that has the sum for each year for each customer
2. We join the CTE with itself to get the next year's sum for each customer
3. We filter out the customers where the next year's sum is greater than the current year's sum and 
also have the difference in the number of rows in both the tables as 1 which means that the customer has skipped a year
*/


with
    yearlycte
    as
    (
        select
            customer_id, year(order_date) 'years', sum(price)  'price'
        from Orders
        group by year(order_date),customer_id
    )

select
    y1.customer_id
from yearlyCTE y1 left join
    yearlyCTE y2 on
y1.customer_id = y2.customer_id
        and y1.years + 1 = y2.years
        and y1.price < y2.price
group by y1.customer_id
having count(*) - count(y2.customer_id) = 1