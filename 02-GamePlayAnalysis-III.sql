-- Problem 2 - Game Play Analysis III (https://leetcode.com/problems/game-play-analysis-iii/)
-- Using Running Sum By Partitioning By player_id and ordering by event_date
SELECT player_id, event_date, SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM Activity;