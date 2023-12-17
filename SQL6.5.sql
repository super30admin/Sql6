# Write your MySQL query statement below

SELECT customer_id, YEAR(order_date),
      SUM(price) OVER (PARTITION BY customer_id, YEAR(order_date) ORDER BY order_date) price
FROM Orders
GROUP BY customer_id, YEAR(order_date)
ORDER BY customer_id, order_date