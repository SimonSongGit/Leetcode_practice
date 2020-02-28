# if guaranteed only one customer placed the most orders
select customer_number from orders
group by customer_number
order by count(*) desc
limit 1;

# more than one customers
select customer_number 
from orders
group by customer_number
having count(order_number) = (select count(order_number) 
                            from orders
                            group by customer_number
                            order by count(order_number) desc
                            limit 1
                            )
