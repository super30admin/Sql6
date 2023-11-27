SELECT A1.player_id, A1.event_date,
    SUM(A2.games_played) as games_played_so_far
FROM Activity A1
JOIN Activity A2
ON A1.player_id = A2.player_id and A1.event_date >= A2.event_date
GROUP BY 1, 2