select e1.Name as Employee
from Employee e1
     inner join Employee e2 on e1.ManagerId=e2.Id
where e1.Salary>e2.Salary;

#inner join can sometimes be replaced by: from table1, table2
#                                         where condition
select e1.Name as Employee
from Employee e1,Employee e2
where e1.ManagerId=e2.Id and e1.Salary>e2.Salary 


