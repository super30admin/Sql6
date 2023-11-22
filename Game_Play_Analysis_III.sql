with CTE as (
select
player_id,
device_id,
event_date,
sum(games_played) over (partition by player_id order by event_date) as 'running_sum'
from Activity
)
select player_id,event_date,running_sum as games_played_so_far  from CTE