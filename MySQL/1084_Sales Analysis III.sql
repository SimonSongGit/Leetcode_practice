select product_id,product_name
from product
where product_id not in (select product_id
                         from sales
                         where sale_date not between '2019-01-01' AND '2019-03-31');
                         
                         
select p.product_id, product_name
from product p,sales s
where p.product_id = s.product_id
group by s.product_id
having max(sale_date) between '2019-01-01' and '2019-03-31'
                        