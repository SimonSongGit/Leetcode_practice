select stock_name,sum(case when operation='sell' then price else -price end) as capital_gain_loss
from stocks
group by stock_name;


select t1.stock_name,sum(t2.price-t1.price) as capital_gain_loss
from  (select price,if(@pre=stock_name,@incr:=@incr+1,@incr:=1) as id,@pre:=stock_name as stock_name
       from stocks,(select @incr:=0,@pre:=0) t1
	   where operation='buy'
	   order by stock_name,operation_day) t1,
       (select price,if(@pre=stock_name,@incr:=@incr+1,@incr:=1) as id,@pre:=stock_name as stock_name
        from stocks,(select @incr:=0,@pre:=0) t1
		where operation='sell') t2
        where t1.stock_name = t2.stock_name and t1.id=t2.id
group by t1.stock_name



