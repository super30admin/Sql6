SELECT MIN(ROUND(SQRT(POW((p1.x - p2.x), 2) + POW((p1.y - p2.y), 2)), 2)) AS 'shortest'
FROM Point2D p1 JOIN Point2D p2
WHERE (p1.x >= p2.x AND p1.y > p2.y) OR
(p1.x >= p2.x AND p1.y < p2.y) OR
(p1.x < p2.x AND p1.y = p2.y)