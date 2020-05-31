select name,ifnull(sum(distance),0) as travelled_distance
from users u
	 left join rides r on u.id=r.user_id
group by u.id
order by travelled_distance desc, name asc;


select distinct name, ifnull((sum(distance) over (partition by user_id)),0) as travel_distance
from rides r
     right join users u on r.user_id = u.id 
order by travel_distance desc, name
      