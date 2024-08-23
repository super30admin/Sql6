SELECT player_id, event_date, sum(games_played) over(Partition by player_id order by event_date) as games_played_so_far
From Activity