select if(id<(select count(*) from seat),if(id mod 2=0,id-1,id+1),if(id mod 2=1,id,id-1)) as id,student
from seat
order by id


