select t1.bin,ifnull(total,0) as total
from (select '[0-5>' as bin
      union
      select '[5-10>'
      union
      select '[10-15>'
      union
      select '[15 or more>') t1
      left join (select *,count(*) as total,if(duration/60<5, '[0-5>',if(duration/60>=5 and duration/60<10,'[5-10>',if(duration/60>=10 and duration/60<15, '[10-15>','[15 or more>'))) as bin
                 from sessions_1435 group by bin) t2 on t1.bin=t2.bin