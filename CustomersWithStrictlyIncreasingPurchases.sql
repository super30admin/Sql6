WITH cte AS (
    SELECT  customer_id,
            YEAR(order_date) AS year,
            SUM(price) AS price
    FROM orders
    GROUP BY 1,2
    ORDER BY 1,2
)
SELECT  DISTINCT c1.customer_id
FROM cte c1
LEFT JOIN cte c2
ON (c1.customer_id = c2.customer_id
AND c1.year + 1 = c2.year
AND c2.price > c1.price)
GROUP BY 1
HAVING COUNT(c1.customer_id) - COUNT(c2.customer_id) = 1;