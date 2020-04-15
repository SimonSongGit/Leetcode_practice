select c1.customer_id,customer_name
from customers c1, (select distinct customer_id,product_name
                    from orders
					where product_name='A' or product_name='B' or product_name='C'
                    group by customer_id
                    having sum(if(product_name='A' or product_name='B',1,-2))=2) c2
where c1.customer_id=c2.customer_id



