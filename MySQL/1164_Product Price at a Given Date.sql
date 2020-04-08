select t1.product_id, if(isnull(new_price),10,new_price) as price
from 
     (select distinct product_id 
      from products
	 ) t1
	 left join
	 (
      select product_id,new_price
	  from products
      where (product_id,change_date) in (
                                         select product_id,max(change_date)
										 from products
										 where change_date<='2019-08-16' 
                                         group by product_id
                                        )
	  ) t2 on t1.product_id=t2.product_id