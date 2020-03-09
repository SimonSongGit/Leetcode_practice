select min(round(sqrt(pow((p2.x-p1.x),2)+pow((p2.y-p1.y),2)),2)) as shortest
from point_2d p1,point_2d p2
where p1.x<p2.x or (p1.x=p2.x and p1.y<p2.y)