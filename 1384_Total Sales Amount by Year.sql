select s.product_id,product_name,all_year as report_year,
       (case when year(period_end)-year(period_start)=0 then average_daily_sales*(to_days(period_end)-to_days(period_start)+1)
			 when year(period_end)-year(period_start)=1 and year(period_start)=all_year then average_daily_sales*(to_days(concat(all_year,'-12-31'))-to_days(period_start)+1)
             when year(period_end)-year(period_start)=1 and year(period_end)=all_year then average_daily_sales*(to_days(period_end)-to_days(concat(all_year,'-01-01'))+1)
             when year(period_end)-year(period_start)=2 and year(period_start)=all_year then average_daily_sales*(to_days(concat(all_year,'-12-31'))-to_days(period_start)+1)
             when year(period_end)-year(period_start)=2 and year(period_end)=all_year then average_daily_sales*(to_days(period_end)-to_days(concat(all_year,'-01-01'))+1)
             else average_daily_sales*365
		end) as total_amount
from sales s
     inner join product p on s.product_id=p.product_id
     cross join (select year(period_start) as all_year
                  from sales
                  union
                  select year(period_end)
                  from sales
                  union
                  select '2019') t1 
where all_year between year(period_start) and year(period_end)
order by s.product_id,report_year