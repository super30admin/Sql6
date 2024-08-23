SELECT DISTINCT player_id, device_id from Activity
where (player_id, event_date) IN (
    SELECT player_id, MIN(event_date) from Activity group by player_id
)
