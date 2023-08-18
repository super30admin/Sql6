with cte as (
select player_id,device_id, event_date, ROW_NUMBER() over (PARTITION BY player_id order by event_date) as row_id from activity)
select player_id,device_id from cte
where row_id=1