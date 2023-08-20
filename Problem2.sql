/*
1. We use the sum window function to get the cumulative sum of games_played for each player in the order of event_date
*/

select
    player_id, event_date , sum(games_played) over (partition by player_id order by event_date) 'games_played_so_far'
from Activity