select avg(Number) as median
from (
select Number,cumsum as end_range,if(cumsum=(select min(Frequency) from numbers),0,@pre) as start_range,@pre:=cumsum
from (
select Number,(sum(Frequency) over (order by Number)) as cumsum
from numbers) t1, (select @pre:=0) t2 
) t3
where (floor(((select sum(Frequency) from numbers)+1)/2) > start_range and
      floor(((select sum(Frequency) from numbers)+1)/2) <= end_range) or
      (floor((select sum(Frequency) from numbers)/2)+1 > start_range and
      floor((select sum(Frequency) from numbers)/2)+1 <= end_range)