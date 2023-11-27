# Write your MySQL query statement below
WITH CTE AS
(
 SELECT player_id, device_id, DENSE_RANK() OVER 
 (PARTITION BY player_id ORDER BY EVENT_DATE) AS rnk 
 FROM ACTIVITY
)
SELECT player_id, device_id FROM CTE WHERE rnk = 1;