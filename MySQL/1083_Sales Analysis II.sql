select buyer_id
from sales s,product p
where s.product_id=p.product_id and p.product_name='S8'
								and buyer_id not in (select distinct buyer_id
                                                     from sales s,product p
                                                     where s.product_id=p.product_id 
                                                           and p.product_name='iPhone'
                                                     );
                                                     
                                                     
select buyer_id
from (select buyer_id,product_name
	  from sales s,product p
	  where s.product_id=p.product_id
	  group by buyer_id
	  having count(distinct s.product_id) = 1 and product_name='S8') t1