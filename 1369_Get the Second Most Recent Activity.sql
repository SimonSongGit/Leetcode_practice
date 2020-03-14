select *
from useractivity
group by username
having count(*)=1

union all

select t1.username,t1.activity,t1.startDate,t1.endDate
from (select @cumsum := (case when username=@uname then @cumsum+1
                              else 1
						 end
						 ) as n, @uname:= username as username,activity,startDate,endDate
	  from (select distinct * from useractivity) u1, (select @cumsum:=0,@uname:=0) tmp
      order by username,endDate desc
      ) t1
where n = 2
