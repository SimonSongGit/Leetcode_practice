select a.Score,(select count(distinct Score) from Scores where Score>=a.Score) as Rank
from Scores a
order by a.Score desc