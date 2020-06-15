select country_name, (case when avg(weather_state)<=15 then 'Cold' 
                           when avg(weather_state)>=25 then 'Hot' 
                           else 'Warm' end) as weather_type
from weather w, countries c
where w.country_id = c.country_id and left(day,7)='2019-11'
group by w.country_id;



select country_name, 
       if(avg(weather_state)>=25,'Hot',if(avg(weather_state)<=15,'Cold','Warm')) as weather_type
from countries c
	 left join weather w on c.country_id=w.country_id
where left(day_,7)='2019-11'
group by country_name