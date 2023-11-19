with cte as (select player_id, min(event_date) as min_date
from Activity
group by player_id)

select Activity.player_id, device_id
from cte 
inner join Activity
on cte.player_id = Activity.player_id and cte.min_date = Activity.event_date

