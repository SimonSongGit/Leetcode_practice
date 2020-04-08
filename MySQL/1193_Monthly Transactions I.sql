#each month of all years use month(trans_date)
#each month of each year use date_format(trans_date,'%Y-%m')
select month(trans_date) as month, country,count(*) as trans_count,
       sum(state='approved') as approved_count,
       sum(amount) trans_total_amount,
       sum(if(state='approved',amount,0)) as approved_total_amount
from transactions
group by month(trans_date), country