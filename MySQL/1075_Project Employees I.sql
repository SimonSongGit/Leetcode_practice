select project_id, round(avg(experience_years),2)  average_years 
from employee e
     inner join project p on e.employee_id=p.employee_id
group by project_id;


# use where clause
select project_id,round(avg(experience_years),2) as average_years 
from project p,employee e
where p.employee_id=e.employee_id
group by project_id