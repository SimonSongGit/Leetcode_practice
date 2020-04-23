select team_id,team_name,sum(ifnull(num_points,0))
from teams t
     left join 
     (select host_team as team,(case when host_goals>guest_goals then 3
									when host_goals=guest_goals then 1
                                    else 0
								end) as num_points
	  from matches
	  union all
      select guest_team as team, (case when host_goals<guest_goals then 3
									when host_goals=guest_goals then 1
                                    else 0
								end) as num_points
	  from matches) t1 on t.team_id=t1.team
group by team_id
order by num_points desc, team_id asc;



select team_id,team_name,sum(ifnull(goal,0)) as num_points
from teams t
	left join (select host_team as team,if(host_goals>guest_goals,3,if(host_goals<guest_goals,0,1)) as goal
               from matches
               union all
               select guest_team as team,if(host_goals<guest_goals,3,if(host_goals>guest_goals,0,1)) as goal
               from matches) t1 on t.team_id=t1.team
group by t.team_id
order by num_points desc,team_id asc