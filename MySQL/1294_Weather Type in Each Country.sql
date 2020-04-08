select country_name, (case when avg(weather_state)<=15 then 'Cold' 
                           when avg(weather_state)>=25 then 'Hot' 
                           else 'Warm' end) as weather_type
from weather w, countries c
where w.country_id = c.country_id and left(day,7)='2019-11'
group by w.country_id