select page_id as recommended_page
from ((select page_id
	  from likes l
           inner join friendship f on l.user_id=f.user2_id
      where user1_id=1
      )
      union
      (select page_id
       from likes l
            inner join friendship f on l.user_id=f.user1_id
	   where user2_id=1
       )) t1
where page_id not in (select page_id
                      from likes
                      where user_id=1)