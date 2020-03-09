select round(t2.num/count(distinct t1.player_id),2) as fraction
from activity t1,
				(select count(player_id) as num
				from activity a
				where (a.player_id,to_days(a.event_date)+1) in (select player_id,to_days(event_date)
																from activity
																)) t2