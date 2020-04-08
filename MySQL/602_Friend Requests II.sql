select id, sum(total) as num
from (
select requester_id as id,count(ifnull(accepter_id,null)) as total
from request_accepted
group by requester_id
union all
select accepter_id as id,count(ifnull(requester_id,null)) as total
from request_accepted
group by accepter_id
) t1
group by id
order by num desc
limit 1;



select ids as id,count(*) as num
from (
		select requester_id as ids
        from request_accepted
        union all
        select accepter_id as ids
        from request_accepted
		) as t1
group by ids
order by num desc
limit 1
