select round(sum(TIV_2016),2) as TIV_2016
from (
		select *
		from insurance
		group by concat(LAT,LON)
		having count(*)=1
		) t1
group by TIV_2015
having count(*)>1