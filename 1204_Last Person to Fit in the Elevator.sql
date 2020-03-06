select person_name
from
    (
    select person_name,(sum(weight) over (order by turn)) as total_weight
    from queue
    ) t
where total_weight<=1000
order by total_weight desc
limit 1;




select person_name
from (
      select person_name,(@w_sum := @w_sum+weight) total_weight
      from queue, (select @w_sum := 0) t
      order by turn
	 ) t1
where total_weight<=1000
order by total_weight desc
limit 1
