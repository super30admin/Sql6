/*
1. We need to find the first login for each player, so we partition by player_id and order by event_date and rank them
2. We select the first rank for each player which gives us the first login for each player
*/

with cte as
(
  select player_id, device_id, rank() over(partition by player_id order by event_date)  'rnk'
  from Activity
)
select player_id, device_id
from cte
where  cte.rnk = 1