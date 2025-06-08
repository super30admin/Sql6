# Write your MySQL query statement below
select a.player_id, a.device_id 
from activity a
where a.event_date in (select min(b.event_date) from activity b where a.player_id=b.player_id)