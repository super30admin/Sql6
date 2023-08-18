 select
    p.firstName,
    p.lastName,
    a.city,
    a.state
    from Person as p
    LEFT join Address as a on a.personId=p.personId