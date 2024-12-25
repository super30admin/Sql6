select 
    p1.firstName as firstName, p1.lastName as lastName, 
    a1.city as city, a1.state as state
from 
    Person p1 left join Address a1
    on
    p1.personId = a1.personId 