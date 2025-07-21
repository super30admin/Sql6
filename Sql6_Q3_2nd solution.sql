with ranked_points as 
(
    select 
        x
        , y
        , row_number() over(order by x, y) as rownum
    from 
        Point2D
)
select 
    min(round(sqrt(pow(p2.x - p1.x , 2) + pow(p2.y - p1.y, 2)),2)) as shortest
from 
    ranked_points p1 inner join ranked_points p2 on p1.rownum < p2.rownum