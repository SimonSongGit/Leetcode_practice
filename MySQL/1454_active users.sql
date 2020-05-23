select a.id,name
from logins a,logins b,accounts c
where a.id=b.id and to_days(a.login_date) = to_days(b.login_date)-1 and a.id=c.id
group by name
having count(distinct a.login_date)>=4

