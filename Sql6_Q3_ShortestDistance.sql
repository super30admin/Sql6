-- Write your MySQL query statement below
select
    round(min(sqrt(pow(p1.x-p2.x, 2) + pow(p1.y-p2.y, 2))),2) as 'shortest'
from point2D p1 inner join point2D p2 on p1.x != p2.x or p1.y != p2.y

-- WITH CTE AS (
--     SELECT x, y, ROW_NUMBER() OVER (ORDER BY x, y) AS r
--     FROM Point2D
-- )
-- SELECT 
--     ROUND(
--         MIN(
--             SQRT(
--                 POW(CTE1.x - CTE2.x, 2) + POW(CTE1.y - CTE2.y, 2)
--             )
--         ), 2
--     ) AS shortest 
-- FROM 
--     CTE AS CTE1,
--     CTE AS CTE2
-- WHERE 
--     CTE1.r < CTE2.r;

-- Try --
-- p1.x < p2.x OR (p1.x = p2.x AND p1.y > p2.y) this will work too
-- ON (p1.x, p1.y) < (p2.x, p2.y);
-- (p1.x!=p2.x OR p1.y!=p2.y) AND (p1.x != p2.y OR p1.y!=p2.x)