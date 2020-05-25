select t2.spend_date, plt as platform,
       ifnull(total,0) as total_amount,
       ifnull(total_users,0) as total_users
from (select distinct spend_date,t1.platform as plt
      from spending
	  cross join (select 'desktop' as platform
                 union
                 select 'mobile' as platform
				 union 
				 select 'both' as platform) t1) t2
                 left join (select spend_date, platform, sum(total_amount) as total,count(*) as total_users
                            from (select spend_date,if(count(*)=2, 'both',platform) as platform,
                                  if(count(*)=2, sum(amount),amount) as total_amount
                                  from spending
                                  group by user_id, spend_date) t3
				             group by spend_date,platform) t4 on t2.spend_date=t4.spend_date and t2.plt=t4.platform;





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

