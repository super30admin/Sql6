'''
4 Problem 4 : Combine Two Tables (https://leetcode.com/problems/combine-two-tables/)
'''

SELECT firstName, lastName, city, state
FROM Person
LEFT JOIN Address ON Address.personId = Person.personId
