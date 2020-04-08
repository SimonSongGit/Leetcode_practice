select round(100*avg(percent),2) as average_daily_percent
from (
       select count(distinct r.post_id)/count(distinct t1.post_id) as percent
	   from actions t1
            left join removals r on t1.post_id=r.post_id
	   where t1.extra = 'spam'
	   group by action_date) t2