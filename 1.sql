
WITH cte AS (
    SELECT 
        player_id AS p, 
        MIN(event_date) AS e
    FROM Activity
    GROUP BY player_id
)
SELECT a.player_id, a.device_id
FROM Activity a
JOIN cte 
ON a.player_id = cte.p AND a.event_date = cte.e;