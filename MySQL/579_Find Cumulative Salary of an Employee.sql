select Id,Month,(sum(Salary) over (partition by Id order by Id,Month)) as Salary
from employee
where (Id,Month) not in (select Id,max(Month) as max_month
                         from employee
						 group by Id
                         )
order by Id asc,Month desc