delete p1 
from Person p1, Person p2
where p1.Id>p2.Id and p1.Email=p2.Email;


delete from Person 
where id not in(select min(id) as id from Person group by email)