-- SELECT  
--     ROUND(Sqrt(Min(Pow(p2.x - p1.x, 2) + Pow(p2.y - p1.y, 2))), 2) AS shortest
-- FROM point_2d p1
--     JOIN point_2d p2
--     ON p1.x != p2.x OR p1.y != p2.y;


#--------------------Optimized the condition to prevent redundant comparison----------------
SELECT  
    ROUND(Sqrt(Min(Pow(p2.x - p1.x, 2) + Pow(p2.y - p1.y, 2))), 2) AS shortest
FROM point_2d p1
    JOIN point_2d p2
ON p1.x < p2.x OR (p1.x = p2.x AND p1.y < p2.y);
