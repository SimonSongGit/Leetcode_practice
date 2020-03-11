select a.follower,count(distinct b.follower) as num
from follow a
     inner join follow b on a.follower=b.followee
group by a.follower
order by a.follower