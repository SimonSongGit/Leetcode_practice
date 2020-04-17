select business_id
from events e
     inner join (select event_type, avg(occurences) as type_avg
                 from events
                 group by event_type
			    ) t on e.event_type=t.event_type
where occurences>type_avg
group by business_id
having count(*)>1;


select *
from events_1126 e
     join  (select event_type,avg(occurences) avg_val
            from events_1126
			group by event_type) t1 on e.event_type=t1.event_type
group by business_id
having sum(occurences>avg_val)>=2
