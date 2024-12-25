# Solution 1: Handle case of same point calculation

# select pts1.x, pts1.y, pts2.x, pts2.y,
#        round(sqrt(pow(pts2.y-pts1.y,2)+pow(pts2.x-pts1.x,2)), 2) as distance

# from 
#     Point2D pts1 
#     join 
#     Point2D pts2

# on
#     pts1.x <= pts2.x AND pts1.y < pts2.y
#     or
#     pts1.x <= pts2.x AND pts1.y > pts2.y
#     or
#     pts1.x > pts2.x AND pts1.y = pts2.y
    

select 
       min(round(sqrt(pow(pts2.y-pts1.y,2)+pow(pts2.x-pts1.x,2)), 2)) as shortest

from 
    Point2D pts1 
    join 
    Point2D pts2

on
    pts1.x <= pts2.x AND pts1.y < pts2.y
    or
    pts1.x <= pts2.x AND pts1.y > pts2.y
    or
    pts1.x > pts2.x AND pts1.y = pts2.y

# Solution 2: Handle duplicate calculation of same pair

# select pts1.x, pts1.y, pts2.x, pts2.y,
#        round(sqrt(pow(pts2.y-pts1.y,2)+pow(pts2.x-pts1.x,2)), 2) as distance

# from 
#     Point2D pts1 
#     join 
#     Point2D pts2

# on
#     pts1.x <= pts2.x AND pts1.y < pts2.y
#     or
#     pts1.x <= pts2.x AND pts1.y > pts2.y
#     or
#     pts1.x > pts2.x AND pts1.y = pts2.y
    

select 
       min(round(sqrt(pow(pts2.y-pts1.y,2)+pow(pts2.x-pts1.x,2)), 2)) as shortest

from 
    Point2D pts1 
    join 
    Point2D pts2

on
    pts1.x <= pts2.x AND pts1.y < pts2.y
    or
    pts1.x <= pts2.x AND pts1.y > pts2.y
    or
    pts1.x > pts2.x AND pts1.y = pts2.y