select round(t2.num/count(distinct t1.player_id),2) as fraction
from activity t1,
				(select count(player_id) as num
				from activity a
				where (a.player_id,to_days(a.event_date)+1) in (select player_id,to_days(event_date)
																from activity
																)) t2;
                                                                
                                                                													
select count(t2.id)/(select count(distinct player_id) from activity)
from   (select a1.player_id as id from activity a1
        inner join activity a2 on a1.player_id=a2.player_id and to_days(a1.event_date)+1 = to_days(a2.event_date)) t2 