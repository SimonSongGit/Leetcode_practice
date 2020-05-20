select t1.event_date as install_dt,count(distinct t1.player_id) as installs,
       round(sum(if(datediff(a.event_date,t1.event_date)=1,1,0))/count(distinct t1.player_id),2) as Day1_retention
from activity a
	 left join
	(select * from activity
      where (player_id,event_date) in (select player_id,min(event_date)
                                       from activity
                                       group by player_id)
	 ) t1 on t1.player_id=a.player_id
group by t1.event_date;



select dt as install_dt, count(pid) as installs, round(count(player_id)/count(pid),2) as Day1_retention
from (select *
      from (select player_id as pid, min(a1.event_date) as dt
			from activity a1
			group by a1.player_id) t1
			left join activity a2 on t1.pid=a2.player_id and datediff(a2.event_date,t1.dt)=1) t2
group by dt