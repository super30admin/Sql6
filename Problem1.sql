-- Game Play Analysis II
-- Algorithm
-- Select a single tuple for each player, namely (player_id, event_date),
-- where event_date is the earliest occurring event_date for the player in
-- question.
-- Identify all rows in the Activity table whose player_id and event_date
-- values match those in the tuple described above, and select the
-- corresponding player_id and device_id values from these rows.

select A1.player_id,A1.device_id  from Activity A1 
where (A1.player_id,A1.event_date) IN 
(select A2.player_id,min(A2.event_date) 
from activity A2 group by A2.player_id)