# Write your MySQL query statement below
select round(SQRT(min(power(p2.x-p1.x, 2) + power(p2.y - p1.y,2))),2) as shortest
from point2D p1, point2D p2 
where (p1.x,  p1.y) != (p2.x, p2.y)
