select ad_id, round((case when sum(action='Clicked' or action='Viewed')=0 then 0
			   else 100*sum(action='Clicked')/sum(action='Clicked' or action='Viewed')
               end),2) as ctr
 
 from ads
 group by ad_id
 order by ctr desc,ad_id asc