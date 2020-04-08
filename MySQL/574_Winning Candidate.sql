select c.Name
from Vote v,Candidate c
where v.CandidateId=c.id
group by v.CandidateId
order by count(*) desc
limit 1