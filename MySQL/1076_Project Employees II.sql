select project_id
from project
group by project_id
having count(employee_id) = (select count(employee_id) as nums
                             from project
                             group by project_id
                             order by nums desc
                             limit 1)