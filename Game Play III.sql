# Write your MySQL query statement below

 #SELECT player_id, event_date, sum(games_played)
 #from activity
 #group by player_id, event_date
 #order by player_id,event_date

#********solution1***********
    # SELECT player_id, event_date, sum(games_played) over(partition  by   player_id order by event_date) as games_played_so_far
    # from activity

#***********solution2************inner join******

SELECT a2.player_id, a2.event_date, sum(a1.games_played) as games_played_so_far from activity a1
inner join activity a2 
on a1.player_id = a2.player_id and a1.event_date<=a2.event_date
group by a2.player_id, a2.event_date

