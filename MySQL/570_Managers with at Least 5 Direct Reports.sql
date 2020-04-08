select name
from employee
where Id in (
             select ManagerId
			 from employee
             group by ManagerId
             having count(ManagerId)>=5
			)