-- Problem 5 - Customers with Strictly Increasing Purchases (https://leetcode.com/problems/customers-with-strictly-increasing-purchases/)
-- Calculating total purchases on a yearly basis for each customer
WITH yearlyincrease AS(
    SELECT customer_id, YEAR(order_date) AS orderyear, SUM(price) AS ordersum
    FROM Orders
    GROUP BY customer_id, orderyear
    ORDER BY customer_id, orderyear
)
-- Selecting the customer_id where total purchases are strictly increasing in a year by joining the yearlyincrease cte with one anothe by left join where ordersum of first table is less than second and orderyear of second table is one greater than first
SELECT y1.customer_id
FROM yearlyincrease y1 
LEFT JOIN yearlyincrease y2
ON y1.customer_id = y2.customer_id
AND y1.orderyear + 1 = y2.orderyear
AND y1.ordersum < y2.ordersum
GROUP BY y1.customer_id
HAVING COUNT(*) - COUNT(y2.customer_id) = 1;