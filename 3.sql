select round(sqrt(min(pow(p1.x-p2.x,2)+pow(p1.y-p2.y,2))),2) as shortest
from Point2D p1
join Point2d p2
where p1.x!=p2.x or p2.y!=p1.y