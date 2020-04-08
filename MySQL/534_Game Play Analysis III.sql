select player_id,event_date, (sum(games_played) over (partition by player_id order by event_date)) as games_played_so_far 
from activity;




select player_id,event_date,(@id_sum := @id_sum*(@p_id=(@p_id:=player_id))+games_played) as games_played_so_far
from activity, (select @id_sum := 0,@p_id := -1) s
order by player_id, event_date
