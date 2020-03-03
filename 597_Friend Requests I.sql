select ifnull(round(count(distinct requester_id,accepter_id)/count(distinct sender_id,send_to_id),2),0.00) as accept_rate
from request_accepted,friend_request