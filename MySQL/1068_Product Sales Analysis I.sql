#time: O(m+n)
select product_name,year,price 
from sales s
     inner join product p on s.product_id=p.product_id;
     
     
# use where clause which equivalent to inner join
select product_name, year,price
from sales s,product p
where s.product_id=p.product_id