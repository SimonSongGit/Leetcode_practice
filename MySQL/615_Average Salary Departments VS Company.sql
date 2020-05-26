select t1.pay_date,department_id, if(davg>cavg,'higher',if(davg=cavg,'same','lower')) as comparison
from (select left(pay_date,7) as pay_date,department_id,avg(amount) as davg
      from salary s
			inner join employee e on s.employee_id=e.employee_id
	 group by pay_date,department_id) t1,
     (select left(pay_date,7) as pay_date,avg(amount) cavg from salary group by pay_date) t2
where t1.pay_date=t2.pay_date;


select pay_month, depart as department_id,if(avg(amount)>average,'higher',if(avg(amount)=average,'same','lower')) as comparison
from (select left(pay_date,7) as pay_month, e.department_id as depart,s.employee_id,
			 avg(amount) over (partition by left(pay_date,7)) as average, amount
      from salary s
            inner join employee e on s.employee_id=e.employee_id) t1
group by pay_month,depart

