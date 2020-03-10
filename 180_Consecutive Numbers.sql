select distinct a.Num as ConsecutiveNums
from Logs a
where (a.Id+1,a.Num) in (select * from Logs) and (a.Id+2,a.Num) in (select * from Logs);



select distinct a.Num as ConsecutiveNums
from Logs a, Logs b,logs c
where a.Num=b.Num and b.Num=c.Num and (a.Id=b.Id+1 and b.Id=c.Id+1)