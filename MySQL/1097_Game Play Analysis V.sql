select t1.event_date as install_dt,count(distinct t1.player_id) as installs,
       round(sum(if(datediff(a.event_date,t1.event_date)=1,1,0))/count(distinct t1.player_id),2) as Day1_retention
from activity a
	 left join
	(select * from activity
      where (player_id,event_date) in (select player_id,min(event_date)
                                       from activity
                                       group by player_id)
	 ) t1 on t1.player_id=a.player_id
group by t1.event_date