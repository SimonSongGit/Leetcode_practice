select Id,Company,Salary
from (select Id,Salary,@num:=(case when Company=@cname then @num+1
                                     else 1
								end) as r,@cname:=Company as Company
	   from employee, (select @num:=0,@cname:=0) t1
       order by Company,Salary
      ) t2
where (Company,r) in 
                 (select Company, if(count(Salary)%2=1,ceiling(count(Salary)/2),ceiling(count(Salary)/2)) as median1
                 from employee
                 group by Company
                 union
                 select Company, if(count(Salary)%2=1,ceiling(count(Salary)/2),ceiling(count(Salary)/2)+1) as median2
                 from employee
                 group by Company)