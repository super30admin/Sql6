
-- using sub query
select player_id, device_id
from activity
where (player_id, event_date) in (select a2.player_id, min(a2.event_date) from activity a2 #group by a2.player_id);

--  window function (row_number)
with CTE as(
   select player_id, device_id, row_number() over (partition by player_id order by event_date) as rn from Activity
)
Select CTE.player_id, CTE.device_id from CTE where CTE.rn = 1

-- last value

with CTE as(
   select distinct player_id, last_value(device_id) over (partition by player_id order by event_date desc range between unbounded preceding and unbounded following) as device_id from Activity
)
Select CTE.player_id, CTE.device_id from CTE;

-- first value

with CTE as(
    select distinct player_id, first_value(device_id) over (partition by player_id order by event_date) as device_id from Activity
)
Select CTE.player_id, CTE.device_id from CTE;