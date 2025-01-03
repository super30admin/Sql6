SELECT ROUND(SQRT(MIN(POW(p2.x - p1.x,2) + POW(p2.y - p1.y,2))), 2) AS 'shortest'
FROM point2D p1 INNER JOIN point2D p2 ON p1.x != p2.x OR p1.y !=p2.y;
