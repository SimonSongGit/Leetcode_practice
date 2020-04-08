select activity
from Friends
group by activity
having count(activity) not in (select max(total)
							   from (select count(*) total
                                     from Friends
                                     group by activity
                                     ) a
								union
                                select min(total)
                                from (select count(*) total
                                      from Friends
                                      group by activity
                                      ) b
								)
                                