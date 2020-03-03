select buyer_id
from sales s,product p
where s.product_id=p.product_id and p.product_name='S8'
								and buyer_id not in (select distinct buyer_id
                                                     from sales s,product p
                                                     where s.product_id=p.product_id 
                                                           and p.product_name='iPhone'
                                                     )