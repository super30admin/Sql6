-- Problem 3 - Shortest Distance in a Plane (https://leetcode.com/problems/shortest-distance-in-a-plane/)
-- Approach 1 - Calculating Shortest Distance Without Eliminating Duplicate Calculations
SELECT ROUND(MIN(SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))), 2) AS 'shortest'
FROM Point2D p1
INNER JOIN Point2D p2
WHERE p1.x != p2.x OR p1.y != p2.y;
-- Approach 2 - Calculating Shortest Distance By Eliminating Duplicate Calculations
SELECT ROUND(MIN(SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))), 2) AS 'shortest'
FROM Point2D p1
INNER JOIN Point2D p2
WHERE (p1.x, p1.y) < (p2.x, p2.y);