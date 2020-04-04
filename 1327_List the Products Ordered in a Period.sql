select product_name, sum(unit) as unit 
from orders o,products p
where left(order_date,7) = '2020-02' and o.product_id=p.product_id
group by o.product_id
having sum(unit)>=100