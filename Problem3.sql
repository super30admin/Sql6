
--Problem3
-- The euclidean distance between two points P1(x1,y1) and P2(x2, y2) in two dimensions is defined as (x1−x2)2+(y1−y2)2\sqrt{(x1-x2)^2+(y1-y2)^2} 
-- (x1−x2) 
-- 2
--  +(y1−y2) 
-- 2
 
-- ​
--  . So in order to get the distances, we can join this table with itself, and then utilize the built-in function POW() and SQRT() like below.

select round(sqrt(min(pow(p1.x-p2.x,2)+pow(p1.y-p2.y,2))),2) as 
shortest from point2d p1 join point2d p2 
on p1.x!=p2.x or p1.y!=p2.y