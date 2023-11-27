# Write your MySQL query statement below
SELECT ROUND(SQRT(MIN(POW (p1.x - p2.x, 2) + POW (p1.y - p2.y, 2))),2) AS shortest
FROM Point2D p1
JOIN point2D p2
ON(p1.X<= p2.x AND p1.y < p2.y)
OR(p1.X<= p2.x AND p1.y > p2.y)
OR(p1.X< p2.x AND p1.y = p2.y);