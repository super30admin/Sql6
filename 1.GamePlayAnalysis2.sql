# 1. CTE Approach with Inner Join

# Write your MySQL query statement below

WITH CTE AS (
    SELECT DISTINCT player_id, MIN(event_date) OVER (PARTITION BY player_id
                                                            ORDER BY event_date) as event_date
        FROM Activity
)

SELECT 
    A.player_id,  
    A.device_id
FROM Activity A
INNER JOIN CTE
    ON CTE.player_id = A.player_id
    AND CTE.event_date = A.event_date;


# 2. Using IN keyword

SELECT a.player_id , a.device_id FROM ACTIVITY a WHERE a.event_date IN (SELECT MIN(b.event_date) FROM
Activity b WHERE a.player_id = b.player_id);

# 3. Dense Rank Function Call

WITH CTE AS (
    
    SELECT player_id, device_id, DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date)
    AS 'rnk'
    FROM Activity
)


SELECT player_id , device_id FROM CTE WHERE RNK=1

