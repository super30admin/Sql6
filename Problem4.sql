-- Combining two tables
select P.firstName ,P.lastName,A.City,A.State from Person P left join Address A on P.personId=A.personId 