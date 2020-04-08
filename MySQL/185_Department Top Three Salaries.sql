select t4.Name as Department, t3.Name as Employee, Salary
from employee t3,department t4
where t3.DepartmentId = t4.Id and 
	 (t3.DepartmentId,t3.Salary) in (select Did,Salary
									 from (select Salary,if(@pre=t1.DepartmentId,@incr:=@incr+1,@incr:=1) as r,@pre:=DepartmentId as Did
                                     from (select distinct DepartmentId,Salary from employee) t1,(select @incr:=0,@pre:=0) t2
									 order by Did,Salary desc) t5
                                     where t5.r<=3
                                     );
		
        
        
select d.Name Department, e1.Name Employee, e1.Salary
from Employee e1 
join Department d
on e1.DepartmentId = d.Id
where 3 > (select count(distinct e2.Salary)
                  from Employee e2 
                  where e2.Salary > e1.Salary 
                  and e1.DepartmentId = e2.DepartmentId
                  );
