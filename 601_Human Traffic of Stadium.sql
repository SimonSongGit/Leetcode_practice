select id,visit_date,people 
from stadium, (select start_id,end_id 
                   from (
                   select s.id as start_id,@incr1:=@incr1+1 as r1
                   from (select @incr1:=0) incr1,(select * from stadium where people>=100) s
                   left join (select * from stadium where people>=100) s1 on s.id=s1.id+1
				   where s1.id is null) t1

		inner join 

                    (select s1.id as end_id,@incr2:=@incr2+1 as r2
                     from (select @incr2:=0) incr2,(select * from stadium where people>=100) s1
                     left join (select * from stadium where people>=100) s2 on s1.id=s2.id-1
                     where s2.id is null) t2 on t1.r1=t2.r2
                     where end_id-start_id>=3) t3
where id between start_id and end_id