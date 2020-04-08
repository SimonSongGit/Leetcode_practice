#if the first login date is unique
select player_id,if(min(event_date),device_id,null) as device_id
from activity
group by player_id;

#if first login date and device_id are not unique
select player_id, 
       device_id 
from   activity 
where  ( player_id, event_date ) in (select player_id, 
                                            min(event_date) 
                                     from   activity 
                                     group by player_id 
                                     ) 
 