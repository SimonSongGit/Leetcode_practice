select project_id,p.employee_id
from project p
     inner join employee e on p.employee_id=e.employee_id
where (project_id,experience_years) in
									  (
                                        select project_id,max(experience_years)
                                        from employee e,project p
										where e.employee_id=p.employee_id 
                                        group by project_id
                                       )