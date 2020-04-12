select name,ifnull(sum(distance),0) as travelled_distance
from users u
	 left join rides r on u.id=r.user_id
group by u.id
order by travelled_distance desc, name asc
      