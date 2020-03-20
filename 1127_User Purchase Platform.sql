select p.spend_date,p.platform,if(total_amount,total_amount,0) as total_amount,if(total_users,total_users,0) as total_users
from (select spend_date,platform
      from spending
	  union
	  select spend_date,if(platform='mobile','desktop','both') as platform
	  from spending) p
      
      left join
      
      (select spend_date,platform,sum(u_amount) as total_amount,count(user_id) as total_users
      from (
            select spend_date,'both' as platform,sum(amount) as u_amount,user_id
            from spending
            group by spend_date,user_id
			having count(platform)=2) t1
		union
		select spend_date,platform,amount as total_amount,count(user_id) as total_users
		from spending
		group by spend_date,user_id
		having count(distinct platform)=1) t2 
		           on p.spend_date=t2.spend_date and p.platform=t2.platform

