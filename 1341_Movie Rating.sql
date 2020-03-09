select tname
from  (
	   select u.name as tname, count(*) as total
       from movie_rating mr
            inner join users u on mr.user_id=u.user_id
	   group by mr.user_id
       order by total desc,tname asc
       limit 1
      ) t1
union all
select tname
from (
       select title as tname, avg(rating) total
	   from movie_rating mr
	        inner join movies m on mr.movie_id=m.movie_id
       where date_format(created_at,'%Y-%m')='2020-02'
       group by mr.movie_id
       order by total desc,tname asc
       limit 1
     ) t2