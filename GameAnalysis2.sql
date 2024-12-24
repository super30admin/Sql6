WITH CTE AS (
SELECT player_id, device_id,event_date, DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) as 'rnk' from Activity
)

SELECT player_id, device_id FROM CTE
where rnk = 1