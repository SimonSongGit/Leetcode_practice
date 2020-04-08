select group_id,players
from (
      select group_id,t1.players,sum(total_score) as scores
      from players p
           inner join 
           (select first_player as players, first_score as total_score
            from matches
			union all
			select second_player as players,second_score as total_score
			from matches
			) t1 on p.player_id = t1.players
        group by t1.players
        order by group_id,scores desc,players
        ) t2
group by group_id






