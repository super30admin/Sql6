--Problem 2 : Game Play Analysis III

Select player_id,event_date,sum(games_played) 
over(partition by player_id order by event_date) as games_played_so_far 
 from activity order by player_id