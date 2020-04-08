select num
from number
group by num
having count(*)=1
order by num desc
limit 1;

select max(t.num) as num 
from (
       select count(num) as total, num from number group by num
      ) t
where t.total=1;