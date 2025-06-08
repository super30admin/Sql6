-- Problem 1 - Game Play Analysis II (https://leetcode.com/problems/game-play-analysis-ii/)
-- Approach 1 - Using Subquery
SELECT a.player_id, a.device_id
FROM Activity a 
WHERE a.event_date IN 
(SELECT MIN(b.event_date) FROM Activity b
WHERE a.player_id = b.player_id);
-- Approach 2 - Using CTE
WITH CTE AS (
    SELECT player_id, device_id, RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS 'rnk'
    FROM Activity
)
SELECT player_id, device_id
FROM CTE
WHERE rnk = 1;