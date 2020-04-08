select invoice_id,t.customer_name,price,contacts_cnt,trusted_contacts_cnt
from invoice i
     left join 
              (
               select c.customer_id,c.customer_name,sum(if(c1.user_id,1,0)) as contacts_cnt,
	                  sum(if(c1.contact_name=c2.customer_name,1,0)) as trusted_contacts_cnt
               from customers c
               left join contacts c1 on c.customer_id=c1.user_id
               left join customers c2 on c1.contact_email=c2.email and c1.contact_name=c2.customer_name
			   group by c.customer_name
			  ) t on i.user_id=t.customer_id
order by invoice_id