# Approach 1: Running Sum
# running sum approach, partiton by player id and order by date
# if we dont have order by clause, we will get total sum of games played by player_id


select 
    player_id, event_date,
    SUM(games_played) over (partition by player_id order by event_date) as games_played_so_far 
from 
    Activity 


# Approach 2: Sub Query
select 
    a1.player_id, a1.event_date,
    (
        select SUM(a2.games_played)
        from activity a2
        where 
            a1.player_id = a2.player_id
            and 
            a1.event_date >= a2.event_date # if we do it (=) then it will be jusy give at that date only
        
    ) as games_played_so_far 
from
    Activity a1