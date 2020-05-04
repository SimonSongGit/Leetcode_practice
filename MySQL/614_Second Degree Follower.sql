select a.follower,count(distinct b.follower) as num
from follow a
     inner join follow b on a.follower=b.followee
group by a.follower
order by a.follower;


select f1.followee,count(distinct f1.follower) as num
from follow f1,follow f2
where f1.followee=f2.follower
group by f1.followee
order by f1.followee