/*
1. We find the distance from point 1 to point 2 using the distance formula
2. We join the table with itself to get all the combinations of points and filter out the points where the x and y coordinates, both are not the same on conditions that
    a. x1<=x2 and y1<y2
    b. x1<=x2 and y1>y2
    c. x1<x2 and y1=y2 to minimize the number of combinations
3. We use the round function to round the distance to 2 decimal places
*/


select min(round(sqrt(pow(p2.x-p1.x,2)+pow(p2.y-p1.y,2)),2)) 'shortest'
from Point2D p1 join Point2D p2
    on (p1.x<=p2.x and p1.y<p2.y)
        or (p1.x<=p2.x and p1.y>p2.y)
        or (p1.x<p2.x and p1.y=p2.y)