SELECT P.firstname, P.lastname, A.city, A.state from person P
left join Address A
on A.personid = P.personid




