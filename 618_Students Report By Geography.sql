select  America, Asia, Europe
from (select @am:=0,@asi:=0,@eur:=0) t,
	 (select @am:=@am+1 as am_id, name as America
     from student
     where continent='America') t1
     left join 
     (select @asi:=@asi+1 as asi_id, name as Asia
     from student
     where continent='Asia') t2 on t1.am_id=t2.asi_id
     left join
     (select @eur:=@eur+1 as eur_id, name as Europe
     from student
     where continent='Europe') t3 on t1.am_id=t3.eur_id

