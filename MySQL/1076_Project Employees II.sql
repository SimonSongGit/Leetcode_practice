select project_id
from project
group by project_id
having count(employee_id) = (select count(employee_id) as nums
                             from project
                             group by project_id
                             order by nums desc
                             limit 1);
                             
                             
#if only one project_id has the most employees
select project_id
from project
group by project_id
order by count(distinct employee_id) desc
limit 1