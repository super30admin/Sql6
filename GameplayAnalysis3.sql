SELECT , player_id, event_date , SUM(games_played) OVER (PARTITION BY player_id Order by event_date) AS games_played_so_far FROM Activity



# SELECT a1.player_id, a1.event_date, (SELECT SUM(a2.games_played) FROM Activity a2 WHERE a1.player_id = a2.player_id AND
a2.player_id <= a1.player_id) AS 'games_played_so_far' FROM Activity a1;