SELECT a.player_id, a.device_id 
FROM activity a 
where a.event_date IN (SELECT MIN(b.event_date) FROM activity b WHERE a.player_id = b.player_id)