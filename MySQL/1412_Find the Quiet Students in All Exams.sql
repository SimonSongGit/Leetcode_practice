select distinct e.student_id,s.student_name
from exam e,student s
where e.student_id=s.student_id and 
      e.student_id not in (select student_id
                           from exam
							where (exam_id,score) in 
						   (select exam_id,min(score) as escore
							from exam
                            group by exam_id
							union all
							select exam_id,max(score) as escore
							from exam
							group by exam_id))