SELECT ROUND(MIN(SQRT(pow(p2.x-p1.x,2) + pow(p2.y-p1.y,2))),2) as 'shortest' from 
point2D p1 INNER JOIN point2D p2 
ON (p1.x, p1.y) < (p2.x, p2.y);