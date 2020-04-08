select t1.pay_date,department_id, if(davg>cavg,'higher',if(davg=cavg,'same','lower')) as comparison
from (select left(pay_date,7) as pay_date,department_id,avg(amount) as davg
      from salary s
			inner join employee e on s.employee_id=e.employee_id
	 group by pay_date,department_id) t1,
     (select left(pay_date,7) as pay_date,avg(amount) cavg from salary group by pay_date) t2
where t1.pay_date=t2.pay_date
