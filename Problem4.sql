/*
1. We need all entries from Person table so we do a left join with Address table on personId column to either get the address or null if the person does not have an address
*/

select firstName, lastName, city, state
from Person p left join
    Address a on p.personId = a.personId