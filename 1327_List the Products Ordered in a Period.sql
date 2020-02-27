select product_name, sum(unit) as unit 
from orders o,products p
where Month(order_date) = 2 and o.product_id=p.product_id
group by o.product_id
having unit>=100