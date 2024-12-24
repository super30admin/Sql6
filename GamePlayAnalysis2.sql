SELECT 
    player_id, device_id
FROM
    (SELECT 
        player_id,
        device_id
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS 'rnk'
     FROM
        Activity)
    AS device_rank
WHERE rnk = 1;