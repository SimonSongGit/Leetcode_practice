#Rank the succeeded and failed dates then select min and max in each ranked group
select st as period_sate,min(d) as start_date,max(d) as end_date
from 
(
select d,@r:= (case when @pre=state then @r else @r+1 end) as r,@pre:=state as st
from (
select 'succeeded' as state, success_date as d
from succeeded s1
union all
select 'failed' as state, fail_date as d
from failed f1) t1, (select @r:=0,@pre:='Unkown') t2
where d between '2019-01-01' and '2019-12-31'
order by d) t3
group by r
order by start_date;




(select period_date,start_date,min(end_date) as end_date 
from
    (select 'succeeded' as period_date,a.success_date as start_date
     from (select * from succeeded where year(success_date)='2019') a
           left join (select * from succeeded where year(success_date)='2019') b on datediff(a.success_date,b.success_date)=1
		   where b.success_date is null) t1
     join 
     (select a.success_date as end_date
      from (select * from succeeded where year(success_date)='2019') a
            left join (select * from succeeded where year(success_date)='2019') b on datediff(b.success_date,a.success_date)=1
            where b.success_date is null) t2
where start_date<=end_date
group by start_date)

union all

(select period_date,start_date,min(end_date) 
from
    (select 'failed' as period_date,a.fail_date as start_date
     from (select * from failed where year(fail_date)='2019') a
           left join (select * from failed where year(fail_date)='2019') b on datediff(a.fail_date,b.fail_date)=1
	 where b.fail_date is null) t1
     join 
     (select a.fail_date as end_date
      from (select * from failed where year(fail_date)='2019') a
            left join (select * from failed where year(fail_date)='2019') b on datediff(b.fail_date,a.fail_date)=1
      where b.fail_date is null) t2
where start_date<=end_date
group by start_date)

order by start_date
