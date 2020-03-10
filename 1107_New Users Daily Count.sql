select login_date,count(*) as user_count
from (
select user_id,activity,min(activity_date) login_date
from traffic_1107
where activity='login'
group by user_id) t1
where datediff('2019-06-30',login_date)<=90
group by login_date