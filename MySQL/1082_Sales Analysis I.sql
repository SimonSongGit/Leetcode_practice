#duplicated rows are real repeated transactions
SELECT seller_id 
FROM   sales 
GROUP  BY seller_id 
HAVING Sum(price) = (SELECT Sum(price) 
                     FROM   sales 
                     GROUP  BY seller_id 
                     ORDER  BY Sum(price) DESC 
                     LIMIT  1); 

# if duplicated rows are redundant mistakes
select seller_id
from (select distinct * from sales) t1
group by seller_id
having sum(price) = (select sum(price)
					 from (select distinct * from sales) t2
                     group by seller_id
                     order by sum(price) desc
                     limit 1)