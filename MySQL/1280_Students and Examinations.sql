select a.student_id,a.student_name,b.subject_name,count(c.student_id) as attended_exams
from students a
	 cross join subjects b
     left join examinations c on a.student_id=c.student_id and b.subject_name=c.subject_name
group by a.student_id,b.subject_name
order by a.student_id,b.subject_name;



#first get number of attended_exams before left join
select s.student_id,student_name,s1.subject_name,ifnull(attended,0) as attended_exams
from students s
	 cross join subjects s1
     left join (select *,count(*) as attended 
                from examinations 
                group by student_id, subject_name) e on s.student_id=e.student_id
													and s1.subject_name=e.subject_name
order by s.student_id,s1.subject_name
