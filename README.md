# Sql6

1 Problem 1 : Game Play Analysis II	(https://leetcode.com/problems/game-play-analysis-ii/)

def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    df= activity.groupby('player_id')[['event_date']].min().reset_index()
    result = df.merge(activity, on =['player_id', 'event_date'])
    return result[["player_id", "device_id"]]

2 Problem 2 : Game Play Analysis III		(https://leetcode.com/problems/game-play-analysis-iii/)

SELECT player_id , event_date, SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS
'games_played_so_far' from activity;


3 Problem 3 : Shortest Distance in a Plane		(https://leetcode.com/problems/shortest-distance-in-a-plane/)

SELECT ROUND(MIN(SQRT(pow(p2.x-p1.x,2) + pow(p2.y-p1.y,2))),2) as 'shortest' from 
point2D p1 INNER JOIN point2D p2 
ON (p1.x, p1.y) < (p2.x, p2.y);

4 Problem 4 : Combine Two Tables	(https://leetcode.com/problems/combine-two-tables/)

import pandas as pd

def combine_two_tables(person: pd.DataFrame, address: pd.DataFrame) -> pd.DataFrame:
    df = person.merge(address, on = 'personId', how = 'left')
    return df[["firstName", "lastName", "city", "state"]]

5 Problem 5 : Customers with Strictly Increasing Purchases		(https://leetcode.com/problems/customers-with-strictly-increasing-purchases/)


WITH CTE AS(
SELECT customer_id , YEAR(order_date) as 'year', SUM(price) as 'price' from orders GROUP BY year , customer_id 
order by customer_id , year
)

SELECT c1.customer_id   from CTE c1 LEFT JOIN CTE c2 ON c1.customer_id = c2.customer_id 
AND c1.year + 1 = c2.year AND c1.price < c2.price GROUP BY c1.customer_id 
HAVING COUNT(*) - COUNT(c2.customer_id) = 1;
