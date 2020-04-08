select business_id
from events e
     inner join (select event_type, avg(occurences) as type_avg
                 from events
                 group by event_type
			    ) t on e.event_type=t.event_type
where occurences>type_avg
group by business_id
having count(*)>1
