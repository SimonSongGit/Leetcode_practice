#partition treat employee with null team_id as one team
select employee_id,(count(employee_id) over (partition by team_id)) as team_size from employee;

#left join treat each null team_id as a separate team
select employee_id,team_size 
from employee e
	 left join
	 (select team_id, count(*) as team_size from employee
      group by team_id) t on e.team_id=t.team_id
