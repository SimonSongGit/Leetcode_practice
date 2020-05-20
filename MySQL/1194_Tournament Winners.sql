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
group by group_id;



select group_id,first_player as player_id
from (select group_id,first_player,sum(first_score) as scores
      from (select first_player, first_score
			from matches
			union all
			select second_player, second_score
			from matches) t1,players p1
			where t1.first_player=p1.player_id
			group by t1.first_player) t2
group by group_id
having max(scores)






