#similar to 180. Consecutive Numbers

#use where statement
select seat_id 
from cinema
where free=1 and ((seat_id+1,free) in (select * from cinema)
				or (seat_id-1,free) in (select * from cinema));
                
                
#use inner join
select distinct a.seat_id 
from cinema a
      inner join cinema b on ((a.seat_id=b.seat_id+1 or a.seat_id=b.seat_id-1) 
							      and a.free=b.free=True
								 )
order by a.seat_id;


select distinct c1.seat_id
from cinema c1, cinema c2
where c1.free = c2.free = 1 and (c1.seat_id = c2.seat_id+1 or c1.seat_id = c2.seat_id-1)
order by c1.seat_id
                
                
