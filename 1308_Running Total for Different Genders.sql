select gender,day, (sum(score_points) over (partition by gender order by day)) as total
from scores
order by gender,day;




select gender,day, (case when gender='F' then @f_sum := @f_sum+score_points
						  else @m_sum := @m_sum+score_points
					 end
                     ) as total					 
from scores s, (select @f_sum := 0, @m_sum := 0) t
order by gender, day