select b.Id
from Weather a,Weather b
where datediff(b.RecordDate,a.RecordDate)=1 and a.Temperature<b.Temperature