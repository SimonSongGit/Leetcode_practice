select customer_id
from customer
group by customer_id
having count(distinct product_key)=(select count(*)
                                    from product
								   );
                                   
                                   
select customer_id
from customer c,product p
where c.product_key=p.product_key
group by customer_id
having count(distinct p.product_key)=(select count(*) from product)