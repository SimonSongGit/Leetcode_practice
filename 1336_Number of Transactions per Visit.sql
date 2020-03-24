select transactions_count,if(isnull(t_count),0,visits_count) as visits_count
from 
(select @count := cast(@count + 1 as signed) as transactions_count 
 from (select @count := -1, @max_count := Ifnull(max(count), 0)
	   from (select count(1) as count 
				from   transactions 
				group by user_id, transaction_date 
				order by null) as tmp) as c
               cross join (select user_id 
                           from   visits
                           union all 
                           select user_id 
                           from   transactions) as m_n
         where  @count < @max_count) t2
         
		 left join (
                    select if(isnull(id),0,trans_count) as t_count,if(isnull(id),trans_count,count(id)) as visits_count
					from (select t.user_id as id,count(if(t.user_id,amount,0)) as trans_count
                          from visits v
                          left join transactions_1336 t on v.user_id=t.user_id and v.visit_date=t.transaction_date
						  group by t.user_id,t.transaction_date) t1
                          group by trans_count
                    ) t3 
		 on t2.transactions_count=t3.t_count



