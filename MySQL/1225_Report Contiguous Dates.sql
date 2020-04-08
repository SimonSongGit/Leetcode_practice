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
