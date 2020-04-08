select query_name,round(avg(rating/position),2) as quality,
                  round(100*sum(rating<3)/count(*),2) as poor_query_percent
from queries
group by query_name