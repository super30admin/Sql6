-- Problem 4 - Combine Two Tables (https://leetcode.com/problems/combine-two-tables/)
-- Approach 1 - Using LEFT JOIN
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
-- Approach 2 - Using RIGHT JOIN
SELECT p.firstName, p.lastName, a.city, a.state
FROM Address a
RIGHT JOIN Person p
ON p.personId = a.personId;