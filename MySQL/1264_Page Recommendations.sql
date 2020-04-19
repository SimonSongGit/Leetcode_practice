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
                      where user_id=1);
                      
                      
select l1.page_id
from friendship f
     left join likes l on f.user1_id=l.user_id
     left join likes l1 on f.user2_id=l1.user_id
where (f.user1_id=1 or f.user2_id=1) and (l1.page_id != (select page_id from likes where user_id=1))