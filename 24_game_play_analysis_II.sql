SELECT a.player_id, a.device_id FROM Activity a 
WHERE a.event_date IN 
(SELECT MIN(b.event_date) FROM Activity b WHERE a.player_id = b.player_id)