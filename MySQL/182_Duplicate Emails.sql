select Email from Person
group by Email
having count(*)>1;



select p1.Email
from Person p1, Person p2
where p1.Id<p2.Id and P1.Email=p2.Email
