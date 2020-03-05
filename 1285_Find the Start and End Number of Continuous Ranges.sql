select start_id,min(end_id) as end_id
from (
      select a.log_id start_Id
	  from logs a
      left join logs b on a.log_id=b.log_id+1
      where b.log_id is null
	 ) t
     join
     (
      select a.log_id end_Id
	  from logs a
      left join logs b on a.log_id=b.log_id-1
      where b.log_id is null
	 ) t1
where start_id<=end_id
group by start_id

