select country_name, (case when avg(weather_state*1.0)<=15.0 then 'Cold'
                           when avg(weather_state*1.0)>=25.0 then 'Hot'
                           else 'Warm'end
					  ) as weather_type
from countries c
inner join weather w on c.country_id=w.country_id
where Month(day)=11
group by country_name