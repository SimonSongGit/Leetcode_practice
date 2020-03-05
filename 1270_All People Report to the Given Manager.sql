select a.employee_id
from employees a
     left join employees b on a.manager_id=b.employee_id
     left join employees c on b.manager_id=c.employee_id
where c.manager_id=1 and a.employee_id!=1

