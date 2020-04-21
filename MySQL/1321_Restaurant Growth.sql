select t1.visited_on,sum(amount) as amount,round(sum(amount)/7,2) as average_amount
from (select c1.visited_on
      from customer c1
           inner join customer c2 on datediff(c1.visited_on,c2.visited_on)=6
      group by c1.visited_on) t1
              left join customer t2 on datediff(t1.visited_on,t2.visited_on)<=6 and datediff(t1.visited_on,t2.visited_on)>=0
group by t1.visited_on
order by t1.visited_on;


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
          

