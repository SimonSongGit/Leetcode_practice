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
order by a.seat_id
                
                
