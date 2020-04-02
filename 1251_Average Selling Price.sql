select p.product_id, round(sum(price*units)/sum(units),2) as average_price
from prices p
	          inner join unitssold u 
              on p.product_id=u.product_id 
				 and (purchase_date between start_date and end_date)
group by p.product_id;



select p.product_id as ids,round(sum(price*units)/sum(units),2) as average_price
from prices p,unitssold u
where p.product_id = u.product_id and (u.purchase_date between p.start_date and p.end_date)
group by p.product_id
