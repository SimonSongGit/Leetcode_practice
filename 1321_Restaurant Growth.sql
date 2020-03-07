select a.visited_on, sum(daily_total) as amount, round(avg(daily_total),2) as average_amount
from
	  (
       select visited_on
       from customer
       group by visited_on
       ) a
	 left join
		(
         select visited_on,sum(amount) daily_total
		 from customer
		 group by visited_on
		 ) b on datediff(a.visited_on,b.visited_on) between 0 and 6
group by a.visited_on
having count(*)=7
order by a.visited_on
          

