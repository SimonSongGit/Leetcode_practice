select ifnull(round(count(distinct requester_id,accepter_id)/count(distinct sender_id,send_to_id),2),0.00) as accept_rate
from request_accepted,friend_request;


#monthly accept rate
select ifnull(round(t2.nums_acc/t1.nums_req,2),0.00) as accept_rate
from (select count(distinct sender_id,send_to_id) as nums_req,left(request_date,7) as rdate
      from friend_request
      group by left(request_date,7)
      ) t1,
      (select count(distinct requester_id,accepter_id) as nums_acc,left(accept_date,7) as adate
      from request_accepted
      group by left(accept_date,7)
      ) t2
where rdate = adate
      
      
