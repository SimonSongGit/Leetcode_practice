select question_id as survey_log
from survey_log
group by survey_log
having sum(action='answer')/sum(action='show') = 
                                                 (select sum(action='answer')/sum(action='show') as total
                                                  from survey_log
                                                  group by question_id
                                                  order by total desc
												  limit 1)
                                                        