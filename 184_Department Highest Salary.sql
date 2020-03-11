select d.Name as Department, e.Name as Employee, Salary
from Employee e, Department d
where e.DepartmentId=d.Id and (d.Name,Salary) in (
                                                  select d.Name, max(Salary)
                                                  from Department d
                                                       inner join Employee e on d.Id=e.DepartmentId
                                                   group by DepartmentId
                                                   );
                                                     
											
