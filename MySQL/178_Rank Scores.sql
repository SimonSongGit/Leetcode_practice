select a.Score,(select count(distinct b.Score) from Scores b where b.Score>a.Score)+1 as Rank
from Scores a
order by a.Score desc