WITH CTE AS(
    SELECT customer_id AS 'c_id', YEAR(order_date) AS 'year', SUM(price) AS 'total' FROM Orders
    GROUP BY c_id, year
    ORDER BY c_id, year
)

SELECT c1.c_id AS 'customer_id' FROM CTE c1 LEFT JOIN CTE c2
ON c1.c_id = c2.c_id
AND c1.total < c2.total AND c1.year + 1 = c2.year
GROUP BY c1.c_id
HAVING COUNT(*) - COUNT(c2.c_id) = 1